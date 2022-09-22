resource "azurerm_virtual_network" "HubVnet-d-eus" {
  name                = "HubVnet-d-eus"
  location            = azurerm_resource_group.rg-wth-network-d-eus.location
  resource_group_name = azurerm_resource_group.rg-wth-network-d-eus.name
  address_space       = ["10.0.0.0/21"]
  dns_servers         = ["10.0.0.196", "10.0.0.197", "168.63.129.16"]
}
