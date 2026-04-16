locals {
  # все ВМ в одном списке
  cloud_vms = {
    web = "netology-${var.vpc_name}-platform-web"
    db  = "netology-${var.vpc_name}-platform-db"
  }
}

locals {
  description = "блок metadata для ВМ"
  vms_metadata = {
    serial-port-enable = var.vms_metadata.serial_port_enable
    ssh-keys           = "${var.vms_metadata.ssh_user}:${var.vms_metadata.ssh_key}"
  }
}
