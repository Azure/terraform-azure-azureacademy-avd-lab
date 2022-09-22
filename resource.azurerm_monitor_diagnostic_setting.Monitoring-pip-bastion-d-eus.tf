resource "azurerm_monitor_diagnostic_setting" "Monitoring-pip-bastion-d-eus" {
  name                       = "Monitoring"
  target_resource_id         = azurerm_public_ip.pip-bastion-d-eus.id
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.MSAA-LogAnalytics-r345xqo624z2.id

  log {
    category = "DDoSProtectionNotifications"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "DDoSMitigationFlowLogs"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "DDoSMitigationReports"
    enabled  = true

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
