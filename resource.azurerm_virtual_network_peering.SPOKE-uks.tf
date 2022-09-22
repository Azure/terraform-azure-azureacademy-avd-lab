resource "azurerm_virtual_network_peering" "SPOKE-uks" {
  name                      = "SPOKE-uks"
  resource_group_name       = azurerm_resource_group.rg-wth-network-d-eus.name
  virtual_network_name      = azurerm_virtual_network.SpokeVnet-d-uks.name
  remote_virtual_network_id = azurerm_virtual_network.HubVnet-d-eus.id
  use_remote_gateways       = true
  allow_forwarded_traffic   = true
}
