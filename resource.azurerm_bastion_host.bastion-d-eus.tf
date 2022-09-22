resource "azurerm_bastion_host" "bastion-d-eus" {
  name                = "bastion-d-eus"
  location            = azurerm_resource_group.rg-wth-network-d-eus.location
  resource_group_name = azurerm_resource_group.rg-wth-network-d-eus.name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.AzureBastionSubnet.id
    public_ip_address_id = azurerm_public_ip.pip-bastion-d-eus.id
  }
}
