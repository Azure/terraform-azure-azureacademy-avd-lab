resource "azurerm_monitor_diagnostic_setting" "Monitoring-nsg-wvd-d-jw" {
  name                       = "Monitoring"
  target_resource_id         = azurerm_network_security_group.nsg-wvd-d-jw.id
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.MSAA-LogAnalytics-r345xqo624z2.id

  log {
    category = "NetworkSecurityGroupEvent"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "NetworkSecurityGroupRuleCounter"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }
}
