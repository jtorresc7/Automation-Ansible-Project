resource "azurerm_availability_set" "windows_avs" {
  name                = var.availability_set_name
  location            = var.location
  resource_group_name = var.resource_group_name
  managed             = true
  tags                = var.tags
}

resource "azurerm_public_ip" "windows_pip" {
  count               = var.vm_count
  name                = "${var.vm_name}-pip-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  domain_name_label   = "a0216cw${count.index + 1}"
  tags                = var.tags
}

resource "azurerm_network_interface" "windows_nic" {
  count               = var.vm_count
  name                = "${var.vm_name}-nic-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  ip_configuration {
    name                          = "${var.vm_name}-ipconfig-${count.index + 1}"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.windows_pip[count.index].id
  }
}

resource "azurerm_windows_virtual_machine" "windows_vm" {
  count                 = var.vm_count
  name                  = "${var.vm_name}-${count.index + 1}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  size                  = var.vm_size
  admin_username        = var.admin_username
  admin_password        = var.admin_password
  network_interface_ids = [azurerm_network_interface.windows_nic[count.index].id]
  availability_set_id   = azurerm_availability_set.windows_avs.id
  tags                  = var.tags

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    name                 = "${var.vm_name}-osdisk-${count.index + 1}"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }

  boot_diagnostics {
    storage_account_uri = var.boot_diagnostics_storage_uri
  }
}

resource "azurerm_virtual_machine_extension" "antimalware" {
  count                      = var.vm_count
  name                       = "${var.vm_name}-antimalware-${count.index + 1}"
  virtual_machine_id         = azurerm_windows_virtual_machine.windows_vm[count.index].id
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = "1.5"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
{
  "AntimalwareEnabled": true,
  "RealtimeProtectionEnabled": true
}
SETTINGS
}
