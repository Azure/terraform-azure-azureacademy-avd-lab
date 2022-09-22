resource "azurerm_storage_share" "shareeusaz140" {
  name                 = "shareeusaz140"
  storage_account_name = azurerm_storage_account.storeusaz140.name
  quota                = 100
  # quota                = 10240
}
