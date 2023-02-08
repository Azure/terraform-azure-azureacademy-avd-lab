resource "azurerm_storage_account" "storuksaz140" {
  name                     = var.storuksaz140name
  resource_group_name      = azurerm_resource_group.rg-wth-avd-d-uks.name
  location                 = azurerm_resource_group.rg-wth-avd-d-uks.location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind             = "FileStorage"

  share_properties {
    retention_policy {
      days = 7
    }
    smb {
      multichannel_enabled = false

    }
  }
  
  tags = {
    Application = "wvdZeroTo140"
    Environment = "Lab"
    CostCenter  = "AZ-140"
    Owner       = "WVD Admin"
  }
}
