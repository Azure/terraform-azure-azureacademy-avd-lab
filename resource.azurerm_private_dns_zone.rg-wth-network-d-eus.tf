resource "azurerm_private_dns_zone" "rg-wth-network-d-eus" {
  name                = "privatelink.file.core.windows.net"
  resource_group_name = azurerm_resource_group.rg-wth-network-d-eus.name
}
