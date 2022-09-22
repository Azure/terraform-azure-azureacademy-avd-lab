resource "azurerm_network_interface" "nic-dc-d-eus-0" {
  name                = "nic-dc-d-eus-0"
  location            = azurerm_resource_group.rg-wth-identity-d-eus.location
  resource_group_name = azurerm_resource_group.rg-wth-identity-d-eus.name

  ip_configuration {
    name                          = "ipConfig0"
    subnet_id                     = azurerm_subnet.snet-identity-d-eus.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.0.196"
  }
}
