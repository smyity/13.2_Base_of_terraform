# создание облачной сети
resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

# создание подсети в зоне A
resource "yandex_vpc_subnet" "web" {
  name           = var.vm_web_vpc_name
  zone           = var.vm_web_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_web_default_cidr
}

# создание подсети в зоне B
resource "yandex_vpc_subnet" "db" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_db_default_cidr
}

# используемый образ
data "yandex_compute_image" "ubuntu" {
  family = var.image_OS
}

### –--ВМ1–-- ###
# создание ВМ
resource "yandex_compute_instance" "platform" {
  name        = var.vm_web_name
  platform_id = "standard-v3"
  zone        = var.vm_web_default_zone
  resources {
    cores         = var.vm_web_perf["cores"]
    memory        = var.vm_web_perf["memory"]
    core_fraction = var.vm_web_perf["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = "network-hdd"
      size     = 10
    }
  }
  # прерываемая машина
  scheduling_policy {
    preemptible = var.vm_web_boolki["stopable_vm"]
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.web.id
    nat       = var.vm_web_boolki["use_external_ip"] # использование внешнего ip
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

### –--ВМ2–-- ###
# создание ВМ
resource "yandex_compute_instance" "db" {
  name        = var.vm_db_name
  platform_id = "standard-v3"
  zone        = var.vm_db_default_zone
  resources {
    cores         = var.vm_db_perf["cores"]
    memory        = var.vm_db_perf["memory"]
    core_fraction = var.vm_db_perf["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = "network-hdd"
      size     = var.vm_db_perf["disk_size"]
    }
  }
  # прерываемая машина
  scheduling_policy {
    preemptible = var.vm_db_boolki["stopable_vm"]
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id
    nat       = var.vm_db_boolki["use_external_ip"] # использование внешнего ip
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}
