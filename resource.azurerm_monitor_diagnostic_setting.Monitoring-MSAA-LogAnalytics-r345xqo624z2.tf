resource "azurerm_monitor_diagnostic_setting" "Monitoring-MSAA-LogAnalytics-r345xqo624z2" {
  name                       = "LAW-Monitoring"
  target_resource_id         = azurerm_log_analytics_workspace.MSAA-LogAnalytics-r345xqo624z2.id
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.MSAA-LogAnalytics-r345xqo624z2.id

  enabled_log {
    category = "Audit"


    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}
