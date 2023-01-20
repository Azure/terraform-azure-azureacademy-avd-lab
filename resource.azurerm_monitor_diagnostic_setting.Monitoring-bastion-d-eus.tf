resource "azurerm_monitor_diagnostic_setting" "Monitoring-bastion-d-eus" {
  name                       = "Bastion-Monitoring"
  target_resource_id         = azurerm_bastion_host.bastion-d-eus.id
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.MSAA-LogAnalytics-r345xqo624z2.id

  enabled_log {
    category = "BastionAuditLogs"


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
