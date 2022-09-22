resource "azurerm_windows_virtual_machine" "vm-dc-d-eus-0" {
  name                  = "vm-dc-d-eus-0"
  location              = azurerm_resource_group.rg-wth-identity-d-eus.location
  resource_group_name   = azurerm_resource_group.rg-wth-identity-d-eus.name
  network_interface_ids = [azurerm_network_interface.nic-dc-d-eus-0.id]
  size                  = "Standard_B2s"
  admin_username        = var.adminusername
  admin_password        = var.adminpassword
  timezone              = var.timezone

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
  os_disk {
    name                 = "disk-dc-p-eus-0-0"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}

