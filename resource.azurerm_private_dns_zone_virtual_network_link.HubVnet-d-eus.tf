resource "azurerm_private_dns_zone_virtual_network_link" "HubVnet-d-eus" {
  name                  = "HubVnet-d-eus"
  resource_group_name   = azurerm_resource_group.rg-wth-network-d-eus.name
  private_dns_zone_name = azurerm_private_dns_zone.rg-wth-network-d-eus.name
  virtual_network_id    = azurerm_virtual_network.HubVnet-d-eus.id
  registration_enabled  = true
}
