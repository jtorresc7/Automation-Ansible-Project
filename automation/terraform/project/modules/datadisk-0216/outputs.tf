output "datadisk_names" {
  value = azurerm_managed_disk.datadisk[*].name
}
