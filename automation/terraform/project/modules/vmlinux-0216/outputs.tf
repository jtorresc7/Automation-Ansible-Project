output "linux_vm_ids" {
  value = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.id]
}

output "linux_hostnames" {
  value = [for vm in azurerm_linux_virtual_machine.linux_vm : vm.name]
}

output "linux_domain_names" {
  value = [for pip in azurerm_public_ip.linux_pip : pip.fqdn]
}

output "linux_private_ip_addresses" {
  value = [for nic in azurerm_network_interface.linux_nic : nic.private_ip_address]
}

output "linux_public_ip_addresses" {
  value = [for pip in azurerm_public_ip.linux_pip : pip.ip_address]
}

output "linux_nic_ids" {
  value = [for nic in azurerm_network_interface.linux_nic : nic.id]
}

output "linux_ip_config_names" {
  value = [for name in keys(azurerm_network_interface.linux_nic) : "${name}-ipconfig"]
}
