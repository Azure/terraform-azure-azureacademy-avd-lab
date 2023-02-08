resource "azurerm_storage_account_network_rules" "storuksaz140-network-rules" {
  storage_account_id = azurerm_storage_account.storuksaz140.id

  default_action = "Deny"
}
