resource "azurerm_log_analytics_workspace" "MSAA-LogAnalytics-r345xqo624z2" {
  name                = "MSAA-LogAnalytics-r345xqo624z2"
  location            = azurerm_resource_group.rg-wth-network-d-eus.location
  resource_group_name = azurerm_resource_group.rg-wth-network-d-eus.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
