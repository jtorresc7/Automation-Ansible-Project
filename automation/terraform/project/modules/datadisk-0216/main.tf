locals {
  all_vm_ids = concat(var.linux_vm_ids, var.windows_vm_ids)
}

resource "azurerm_managed_disk" "datadisk" {
  count                = length(local.all_vm_ids)
  name                 = "0216-datadisk-${count.index + 1}"
  location             = var.location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags                 = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "attach" {
  count              = length(local.all_vm_ids)
  managed_disk_id    = azurerm_managed_disk.datadisk[count.index].id
  virtual_machine_id = local.all_vm_ids[count.index]
  lun                = count.index
  caching            = "ReadWrite"
}
