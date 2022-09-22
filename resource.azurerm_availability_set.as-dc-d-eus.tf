resource "azurerm_availability_set" "as-dc-d-eus" {
  name                = "as-dc-d-eus"
  location            = azurerm_resource_group.rg-wth-identity-d-eus.location
  resource_group_name = azurerm_resource_group.rg-wth-identity-d-eus.name
}
