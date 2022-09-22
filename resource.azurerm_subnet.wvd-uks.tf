resource "azurerm_subnet" "wvd-uks" {
  name                                          = "wvd-uks"
  resource_group_name                           = azurerm_resource_group.rg-wth-network-d-eus.name
  virtual_network_name                          = azurerm_virtual_network.SpokeVnet-d-uks.name
  address_prefixes                              = ["20.1.0.0/21"]
  private_endpoint_network_policies_enabled     = true
  private_link_service_network_policies_enabled = false
}
