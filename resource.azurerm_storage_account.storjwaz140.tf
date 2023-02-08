resource "azurerm_storage_account" "storjwaz140" {
  name                     = var.storjwaz140name
  resource_group_name      = azurerm_resource_group.rg-wth-avd-d-jw.name
  location                 = azurerm_resource_group.rg-wth-avd-d-jw.location
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

  # network_rules {
  #   default_action             = "Deny"
  #   virtual_network_subnet_ids = []
  #   ip_rules                   = [var.mypublicipaddress]
  # }

  tags = {
    Application = "wvdZeroTo140"
    Environment = "Lab"
    CostCenter  = "AZ-140"
    Owner       = "WVD Admin"
  }
}
