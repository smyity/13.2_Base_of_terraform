# создание облачной сети
resource "yandex_vpc_network" "cloud" {
  name = var.vpc_name
}

# создание подсети в зоне A
resource "yandex_vpc_subnet" "web" {
  name           = "${var.vpc_name}-web"
  zone           = var.default_zone.web
  network_id     = yandex_vpc_network.cloud.id
  v4_cidr_blocks = [var.default_cidr.web]
}

# создание подсети в зоне B
resource "yandex_vpc_subnet" "db" {
  name           = "${var.vpc_name}-db"
  zone           = var.default_zone.db
  network_id     = yandex_vpc_network.cloud.id
  v4_cidr_blocks = [var.default_cidr.db]
}

# используемый образ
data "yandex_compute_image" "ubuntu" {
  family = var.image_OS
}

### –--ВМ1–-- ###
resource "yandex_compute_instance" "platform" {
  name        = local.cloud_vms.web
  platform_id = "standard-v3"
  zone        = var.default_zone.web
  resources {
    cores         = var.perf.web["cores"]
    memory        = var.perf.web["memory"]
    core_fraction = var.perf.web["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = "network-hdd"
      size     = var.perf.web["disk_size"]
    }
  }
  # прерываемая машина
  scheduling_policy {
    preemptible = var.boolki.stopable_vm
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.web.id
    nat       = var.boolki.use_external_ip # использование внешнего ip
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}

### –--ВМ2–-- ###
resource "yandex_compute_instance" "db" {
  name        = local.cloud_vms.db
  platform_id = "standard-v3"
  zone        = var.default_zone.db
  resources {
    cores         = var.perf.db["cores"]
    memory        = var.perf.db["memory"]
    core_fraction = var.perf.db["core_fraction"]
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = "network-hdd"
      size     = var.perf.db["disk_size"]
    }
  }
  # прерываемая машина
  scheduling_policy {
    preemptible = var.boolki.stopable_vm
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db.id
    nat       = var.boolki.use_external_ip # использование внешнего ip
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }
}
