resource "azurerm_public_ip" "pip-bastion-d-eus" {
  name                = "pip-bastion-d-eus"
  location            = azurerm_resource_group.rg-wth-network-d-eus.location
  resource_group_name = azurerm_resource_group.rg-wth-network-d-eus.name
  allocation_method   = "Static"
  sku                 = "Standard"
}
