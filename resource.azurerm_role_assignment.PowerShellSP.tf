resource "azurerm_role_assignment" "PowerShellSP" {
  scope                = data.azurerm_subscription.current.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.PowerShellSP.object_id
}
