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

# ---ВМ1 (vm_web)--- #
variable "vm_web_default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_web_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vm_web_vpc_name" {
  type        = string
  default     = "develop"
  description = "subnet name"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM name"
}

variable "vm_web_perf" {
  type    = map(number)
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
}

variable "vm_web_boolki" {
  description = "boolean vars"
  type    = map(bool)
  default = {
    stopable_vm     = true
    use_external_ip = true
  }
}

# ---ВМ2 (vm_db)--- #
variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "зона доступности b"
}

variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "выделенная маска подсети"
}

variable "vm_db_vpc_name" {
  type        = string
  default     = "db"
  description = "название виртуальной сети и подсети"
}

variable "vm_db_name" {
  type        = string
  default     = "netology-develop-platform-db"
  description = "название ВМ"
}

variable "vm_db_perf" {
  type    = map(number)
  default = {
    cores         = 4
    memory        = 8
    core_fraction = 50
    disk_size     = 15
  }
}

variable "vm_db_boolki" {
  description = "boolean vars"
  type    = map(bool)
  default = {
    stopable_vm     = true
    use_external_ip = true
  }
}
