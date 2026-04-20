output "windows_vm_ids" {
  value = azurerm_windows_virtual_machine.windows_vm[*].id
}

output "windows_hostname" {
  value = azurerm_windows_virtual_machine.windows_vm[0].name
}

output "windows_domain_name" {
  value = azurerm_public_ip.windows_pip[0].fqdn
}

output "windows_private_ip_address" {
  value = azurerm_network_interface.windows_nic[0].private_ip_address
}

output "windows_public_ip_address" {
  value = azurerm_public_ip.windows_pip[0].ip_address
}
