resource "azurerm_subnet_network_security_group_association" "wvd-eus" {
  subnet_id                 = azurerm_subnet.wvd-eus.id
  network_security_group_id = azurerm_network_security_group.nsg-wvd-d-eus.id
}
