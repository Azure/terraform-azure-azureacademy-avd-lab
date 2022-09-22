resource "azurerm_virtual_network" "SpokeVnet-d-uks" {
  name                = "SpokeVnet-d-uks"
  location            = "uksouth"
  resource_group_name = azurerm_resource_group.rg-wth-network-d-eus.name
  address_space       = ["20.1.0.0/21"]
  tags = {
    Application = "wvdZeroTo140"
    Environment = "Lab"
    CostCenter  = "AZ-140"
    Owner       = "WVD Admin"
  }
}
