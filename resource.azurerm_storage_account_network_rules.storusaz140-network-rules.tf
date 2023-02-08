resource "azurerm_storage_account_network_rules" "storusaz140-network-rules" {
  storage_account_id = azurerm_storage_account.storusaz140.id

  default_action = "Deny"
}
