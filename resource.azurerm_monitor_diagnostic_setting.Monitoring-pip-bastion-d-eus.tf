resource "azurerm_monitor_diagnostic_setting" "Monitoring-pip-bastion-d-eus" {
  name                       = "Bastion-PIP-Monitoring"
  target_resource_id         = azurerm_public_ip.pip-bastion-d-eus.id
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.MSAA-LogAnalytics-r345xqo624z2.id

  enabled_log {
    category = "DDoSProtectionNotifications"


    retention_policy {
      enabled = false
    }
  }

  enabled_log {
    category = "DDoSMitigationFlowLogs"


    retention_policy {
      enabled = false
    }
  }

  enabled_log {
    category = "DDoSMitigationReports"


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
