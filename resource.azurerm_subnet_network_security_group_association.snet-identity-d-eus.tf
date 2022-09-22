resource "azurerm_subnet_network_security_group_association" "snet-identity-d-eus" {
  subnet_id                 = azurerm_subnet.snet-identity-d-eus.id
  network_security_group_id = azurerm_network_security_group.nsg-identity-d-eus.id
}
