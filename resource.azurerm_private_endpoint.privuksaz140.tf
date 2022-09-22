resource "azurerm_private_endpoint" "privuksaz140" {
  name                = "privuksaz140"
  resource_group_name = azurerm_resource_group.rg-wth-avd-d-uks.name
  location            = azurerm_resource_group.rg-wth-avd-d-uks.location
  subnet_id           = azurerm_subnet.wvd-uks.id
  private_dns_zone_group {
    name                 = "wth-avd-d-uks"
    private_dns_zone_ids = [azurerm_private_dns_zone.rg-wth-network-d-eus.id]
  }

  private_service_connection {
    name                           = "privuksaz140-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.storuksaz140.id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }

  tags = {
    Application = "wvdZeroTo140"
    Environment = "Lab"
    CostCenter  = "AZ-140"
    Owner       = "WVD Admin"
  }
}
