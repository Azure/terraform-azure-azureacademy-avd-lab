resource "azurerm_private_dns_zone_virtual_network_link" "SpokeVnet-d-jw" {
  name                  = "SpokeVnet-d-jw"
  resource_group_name   = azurerm_resource_group.rg-wth-network-d-eus.name
  private_dns_zone_name = azurerm_private_dns_zone.rg-wth-network-d-eus.name
  virtual_network_id    = azurerm_virtual_network.SpokeVnet-d-jw.id
  registration_enabled  = true
}
