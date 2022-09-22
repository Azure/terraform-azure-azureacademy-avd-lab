resource "azurerm_subnet_network_security_group_association" "AzureBastionSubnet" {
  subnet_id                 = azurerm_subnet.AzureBastionSubnet.id
  network_security_group_id = azurerm_network_security_group.nsg-bastion-d-eus.id
}
