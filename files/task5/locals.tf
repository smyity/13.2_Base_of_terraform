locals {
  # все ВМ в одном списке
  cloud_vms = {
    web = "netology-${var.vpc_name}-platform-web"
    db  = "netology-${var.vpc_name}-platform-db"
  }
}
