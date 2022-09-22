resource "azurerm_virtual_network_peering" "HUB-uks" {
  name                         = "HUB-uks"
  resource_group_name          = azurerm_resource_group.rg-wth-network-d-eus.name
  virtual_network_name         = azurerm_virtual_network.HubVnet-d-eus.name
  remote_virtual_network_id    = azurerm_virtual_network.SpokeVnet-d-uks.id
  allow_virtual_network_access = true
  allow_gateway_transit        = true
}
