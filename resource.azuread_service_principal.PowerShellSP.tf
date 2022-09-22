resource "azuread_service_principal" "PowerShellSP" {
  application_id               = azuread_application.PowerShellApp.application_id
  app_role_assignment_required = false
  owners                       = [data.azuread_client_config.current.object_id]
}
