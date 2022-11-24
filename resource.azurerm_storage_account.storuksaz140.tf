resource "azurerm_storage_account" "storuksaz140" {
  name                     = var.storukaz140name
  resource_group_name      = azurerm_resource_group.rg-wth-avd-d-uks.name
  location                 = azurerm_resource_group.rg-wth-avd-d-uks.location
  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind             = "FileStorage"

  share_properties {
    retention_policy {
      days = 7
    }
  }

  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = []
    ip_rules                   = [var.mypublicipaddress]
  }

  tags = {
    Application = "wvdZeroTo140"
    Environment = "Lab"
    CostCenter  = "AZ-140"
    Owner       = "WVD Admin"
  }
}
