resource "azurerm_virtual_network" "SpokeVnet-d-jw" {
  name                = "SpokeVnet-d-jw"
  location            = "japanwest"
  resource_group_name = azurerm_resource_group.rg-wth-network-d-eus.name
  address_space       = ["30.1.0.0/21"]
  tags = {
    Application = "wvdZeroTo140"
    Environment = "Lab"
    CostCenter  = "AZ-140"
    Owner       = "WVD Admin"
  }
}
