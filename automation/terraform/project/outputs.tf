output "resource_group_name" {
  value = module.rgroup.resource_group_name
}

output "virtual_network_name" {
  value = module.network.virtual_network_name
}

output "subnet_name" {
  value = module.network.subnet_name
}

output "log_analytics_workspace_name" {
  value = module.common.log_analytics_workspace_name
}

output "recovery_services_vault_name" {
  value = module.common.recovery_services_vault_name
}

output "storage_account_name" {
  value = module.common.storage_account_name
}

output "linux_hostnames" {
  value = module.vmlinux.linux_hostnames
}

output "linux_domain_names" {
  value = module.vmlinux.linux_domain_names
}

output "linux_private_ip_addresses" {
  value = module.vmlinux.linux_private_ip_addresses
}

output "linux_public_ip_addresses" {
  value = module.vmlinux.linux_public_ip_addresses
}

output "windows_hostname" {
  value = module.vmwindows.windows_hostname
}

output "windows_domain_name" {
  value = module.vmwindows.windows_domain_name
}

output "windows_private_ip_address" {
  value = module.vmwindows.windows_private_ip_address
}

output "windows_public_ip_address" {
  value = module.vmwindows.windows_public_ip_address
}

output "datadisk_names" {
  value = module.datadisk.datadisk_names
}

output "load_balancer_name" {
  value = module.loadbalancer.load_balancer_name
}

output "database_name" {
  value = module.database.postgresql_server_name
}
