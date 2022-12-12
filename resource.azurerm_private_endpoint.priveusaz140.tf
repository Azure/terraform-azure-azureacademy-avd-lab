resource "azurerm_private_endpoint" "priveusaz140" {
  name                = "priveusaz140"
  resource_group_name = azurerm_resource_group.rg-wth-avd-d-eus.name
  location            = azurerm_resource_group.rg-wth-avd-d-eus.location
  subnet_id           = azurerm_subnet.wvd-eus.id
  private_dns_zone_group {
    name                 = "wth-avd-d-eus"
    private_dns_zone_ids = [azurerm_private_dns_zone.rg-wth-network-d-eus.id]
  }

  private_service_connection {
    name                           = "priveusaz140-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.storusaz140.id
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
