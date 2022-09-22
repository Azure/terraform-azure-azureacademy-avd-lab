resource "azurerm_subnet_network_security_group_association" "wvd-jw" {
  subnet_id                 = azurerm_subnet.wvd-jw.id
  network_security_group_id = azurerm_network_security_group.nsg-wvd-d-jw.id
}
