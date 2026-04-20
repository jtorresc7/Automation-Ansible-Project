resource "null_resource" "linux_provisioner" {
  for_each = var.vm_names

  depends_on = [
    azurerm_linux_virtual_machine.linux_vm
  ]

  connection {
    type        = "ssh"
    user        = var.admin_username
    host        = azurerm_public_ip.linux_pip[each.value].ip_address
    private_key = file(replace(var.public_key_path, ".pub", ""))
  }

  provisioner "remote-exec" {
    inline = [
      "hostname"
    ]
  }
}

