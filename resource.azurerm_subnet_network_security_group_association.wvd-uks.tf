resource "azurerm_subnet_network_security_group_association" "wvd-uks" {
  subnet_id                 = azurerm_subnet.wvd-uks.id
  network_security_group_id = azurerm_network_security_group.nsg-wvd-d-uks.id
}
