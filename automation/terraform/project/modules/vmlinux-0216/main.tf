resource "azurerm_availability_set" "linux_avs" {
  name                = var.availability_set_name
  location            = var.location
  resource_group_name = var.resource_group_name
  managed             = true
  tags                = var.tags
}

resource "azurerm_public_ip" "linux_pip" {
  for_each            = var.vm_names
  name                = "${each.value}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "linux-${each.value}"
  tags                = var.tags
}

resource "azurerm_network_interface" "linux_nic" {
  for_each            = var.vm_names
  name                = "${each.value}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "${each.value}-ipconfig"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux_pip[each.value].id
  }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
  for_each                        = var.vm_names
  name                            = each.value
  location                        = var.location
  resource_group_name             = var.resource_group_name
  size                            = var.vm_size
  admin_username                  = var.admin_username
  network_interface_ids           = [azurerm_network_interface.linux_nic[each.value].id]
  availability_set_id             = azurerm_availability_set.linux_avs.id
  disable_password_authentication = true
  tags                            = var.tags

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.public_key_path)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "${each.value}-osdisk"
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_uri
  }
}

resource "azurerm_virtual_machine_extension" "network_watcher" {
  for_each                   = var.vm_names
  name                       = "${each.value}-networkwatcher"
  virtual_machine_id         = azurerm_linux_virtual_machine.linux_vm[each.value].id
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentLinux"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
}

resource "azurerm_virtual_machine_extension" "azure_monitor" {
  for_each                   = var.vm_names
  name                       = "${each.value}-azuremonitor"
  virtual_machine_id         = azurerm_linux_virtual_machine.linux_vm[each.value].id
  publisher                  = "Microsoft.Azure.Monitor"
  type                       = "AzureMonitorLinuxAgent"
  type_handler_version       = "1.0"
  auto_upgrade_minor_version = true
}
