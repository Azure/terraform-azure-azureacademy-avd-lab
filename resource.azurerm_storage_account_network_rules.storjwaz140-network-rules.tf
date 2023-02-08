resource "azurerm_storage_account_network_rules" "storjwaz140-network-rules" {
  storage_account_id = azurerm_storage_account.storjwaz140.id

  default_action = "Deny"
}
