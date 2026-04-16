# одинаковый образ для всех ВМ
variable "image_OS" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "ubuntu 22.04"
}

# одинаковое название облачной сети
variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "название облачной сети"
}

# одинаковое параметры boolean
variable "boolki" {
  description = "boolean vars"
  type    = map(bool)
  default = {
    stopable_vm     = true
    use_external_ip = true
  }
}

# ---block VM--- #
variable "default_zone" {
  description = "зона доступности"
  type    = map(string)
  default = {
    web = "ru-central1-a"
    db  = "ru-central1-b"
  }
}

variable "default_cidr" {
  description = "маска подсети"
  type    = map(string)
  default = {
    web = "10.0.1.0/24"
    db  = "10.0.2.0/24"
  }
}

/*
variable "name" {
  description = "название ВМ"
  type    = map(string)
  default = {
    web = "netology-develop-platform-web"
    db  = "netology-develop-platform-db"
  }
}
*/

variable "perf" {
  description = "ресурсы"
  type    = map(any)
  default = {
    web = {
      cores         = 2
      memory        = 2
      core_fraction = 20
      disk_size     = 10
    }
    db = {
      cores         = 4
      memory        = 8
      core_fraction = 50
      disk_size     = 15
    }
  }
}
