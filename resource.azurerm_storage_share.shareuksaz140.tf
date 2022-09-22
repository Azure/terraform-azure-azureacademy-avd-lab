resource "azurerm_storage_share" "shareuksaz140" {
  name                 = "shareuksaz140"
  storage_account_name = azurerm_storage_account.storuksaz140.name
  quota                = 100
  # quota                = 10240
}
