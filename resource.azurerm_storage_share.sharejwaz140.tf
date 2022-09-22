resource "azurerm_storage_share" "sharejwaz140" {
  name                 = "sharejwaz140"
  storage_account_name = azurerm_storage_account.storjwaz140.name
  quota                = 100
  # quota                = 10240
}
