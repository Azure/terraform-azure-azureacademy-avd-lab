resource "azuread_service_principal_password" "PowerShellSPPassword" {
  service_principal_id = azuread_service_principal.PowerShellSP.object_id
}
