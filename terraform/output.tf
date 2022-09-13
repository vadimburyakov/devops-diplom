output "entrance_vburyakov_ru_ip_addr_external" {
  value = yandex_compute_instance.entrance_instance.network_interface.0.nat_ip_address
}

output "db01_vburyakov_ru_ip_addr_internal" {
  value = yandex_compute_instance.db01_instance.network_interface.0.ip_address
}

output "db02_vburyakov_ru_ip_addr_internal" {
  value = yandex_compute_instance.db02_instance.network_interface.0.ip_address
}

output "app_vburyakov_ru_ip_addr_internal" {
  value = yandex_compute_instance.app_instance.network_interface.0.ip_address
}

output "monitoring_vburyakov_ru_ip_addr_internal" {
  value = yandex_compute_instance.monitoring_instance.network_interface.0.ip_address
}

output "gitlab_vburyakov_ru_ip_addr_internal" {
  value = yandex_compute_instance.gitlab_instance.network_interface.0.ip_address
}

output "runner_vburyakov_ru_ip_addr_internal" {
  value = yandex_compute_instance.runner_instance.network_interface.0.ip_address
}

output "ssh_config" {
  value = <<-EOT
  Host vburyakov.ru
    HostName ${yandex_compute_instance.entrance_instance.network_interface.0.nat_ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa

  Host db01.vburyakov.ru
    HostName ${yandex_compute_instance.db01_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host db02.vburyakov.ru
    HostName ${yandex_compute_instance.db02_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host app.vburyakov.ru
    HostName ${yandex_compute_instance.app_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host monitoring.vburyakov.ru
    HostName ${yandex_compute_instance.monitoring_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host gitlab.vburyakov.ru
    HostName ${yandex_compute_instance.gitlab_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  Host runner.vburyakov.ru
    HostName ${yandex_compute_instance.runner_instance.network_interface.0.ip_address}
    User ubuntu
    IdentityFile ~/.ssh/id_rsa
      ProxyJump ubuntu@${yandex_compute_instance.nat_instance.network_interface.0.nat_ip_address}
      ProxyCommand ssh -W %h:%p -i .ssh/id_rsa

  EOT
}
