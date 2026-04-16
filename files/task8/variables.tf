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

# ssh vars
variable "vms_metadata" {
  type = object({
    serial_port_enable = number
    ssh_user           = string
    ssh_key            = string
  })
  default = {
    serial_port_enable = 1
    ssh_user           = "ubuntu"
    ssh_key            = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCng7JNHRuQCrIY4sPVlVHRb+jaAHdRnx/ZPT9FYgxTd3MbECxqNTYldRGeaWAn/fzf6ixIv5A8VfB1kM6yxbmkWE6DM9GKsk2QMe/ikaTR06OEJEwfPyKf7pKTXRIm2VG0+Y5lzu3RfapAzsLkxS3tAMT1dbnfQW2IxzrybmPApe3vdDwHoAoThQ6yp3M1/cO3VADv3znTaLs/lLwGanTjAf22PetJm0lZwA/e6hho9yHanAAzYQn1gzzaXA5k7jaIU88pXwSY0jGlrbs/dk4dbMEJ5KpfxNEYq3/KCRfe02BOLj5EEigHxZ2EsHizsoiKwJM8ULFXQFvGvQ9FDqVV"
  }
}

# инициализация переменной
variable "test" {
  type = list(map(list(string)))
}
