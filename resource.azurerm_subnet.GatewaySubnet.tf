resource "azurerm_subnet" "GatewaySubnet" {
  name                 = "GatewaySubnet"
  resource_group_name  = azurerm_resource_group.rg-wth-network-d-eus.name
  virtual_network_name = azurerm_virtual_network.HubVnet-d-eus.name
  address_prefixes     = ["10.0.0.0/26"]
}
