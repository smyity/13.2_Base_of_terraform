/*
конструкция цикла для output
output "all_instance_ids" { value = [for s in aws_instance.web : s.id] }

вместо aws_instance.web передать список(list) ВМ --> [yandex_compute_instance.platform, yandex_compute_instance.db]
после : передается словарь {instance_name = ?, external_ip = ?, fqdn = ?}
*/

output "task_value" {
  value = [
    for vm in [yandex_compute_instance.platform, yandex_compute_instance.db] : {
      instance_name = vm.name
      external_ip   = vm.network_interface.0.nat_ip_address
      fqdn          = vm.fqdn
    }
  ]
  description = "Список данных по созданным ВМ"
}
