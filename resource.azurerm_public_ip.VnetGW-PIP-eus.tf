resource "azurerm_public_ip" "VnetGW-PIP-eus" {
  name                = "VnetGW-PIP-eus"
  location            = azurerm_resource_group.rg-wth-network-d-eus.location
  resource_group_name = azurerm_resource_group.rg-wth-network-d-eus.name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = [1, 2, 3]
  tags = {
  }
}
