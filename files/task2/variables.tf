variable "cloud_id" {
  type        = string
  default = "b1gc3k00qi2fi08ed282"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default = "b1gbhs59559ntu7hvlcn"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

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
  description = "VPC network & subnet name"
}

# new vars
variable "vm_web_image_OS" {
  type        = string
  default     = "ubuntu-2204-lts"
  description = "ubuntu 22.04"
}

variable "vm_web_name" {
  type        = string
  default     = "netology-develop-platform-web"
  description = "VM name"
}

# использование словарей
#variable "vm_web_perf" { description = "config resources for Yandex Cloud"
#  type = object({ cores = number, memory = number, core_fraction = number })
#  default = { cores = 1, memory = 2, core_fraction = 20 }}

# использование map(т.к. все значения одинакового типа)
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

# ssh vars

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCng7JNHRuQCrIY4sPVlVHRb+jaAHdRnx/ZPT9FYgxTd3MbECxqNTYldRGeaWAn/fzf6ixIv5A8VfB1kM6yxbmkWE6DM9GKsk2QMe/ikaTR06OEJEwfPyKf7pKTXRIm2VG0+Y5lzu3RfapAzsLkxS3tAMT1dbnfQW2IxzrybmPApe3vdDwHoAoThQ6yp3M1/cO3VADv3znTaLs/lLwGanTjAf22PetJm0lZwA/e6hho9yHanAAzYQn1gzzaXA5k7jaIU88pXwSY0jGlrbs/dk4dbMEJ5KpfxNEYq3/KCRfe02BOLj5EEigHxZ2EsHizsoiKwJM8ULFXQFvGvQ9FDqVV"
  description = "ssh-keygen -t ed25519"
}
