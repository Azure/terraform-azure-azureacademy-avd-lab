resource "azuread_application" "PowerShellApp" {
  display_name = "PowerShellApp"
  owners       = [data.azuread_client_config.current.object_id]
}
