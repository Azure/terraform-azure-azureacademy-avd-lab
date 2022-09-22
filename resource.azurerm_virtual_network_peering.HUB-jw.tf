resource "azurerm_virtual_network_peering" "HUB-jw" {
  name                         = "HUB-jw"
  resource_group_name          = azurerm_resource_group.rg-wth-network-d-eus.name
  virtual_network_name         = azurerm_virtual_network.HubVnet-d-eus.name
  remote_virtual_network_id    = azurerm_virtual_network.SpokeVnet-d-jw.id
  allow_virtual_network_access = true
  allow_gateway_transit        = true
}
