resource "azurerm_monitor_diagnostic_setting" "Monitoring-VnetGW-eus" {
  name                       = "VnetGW-Monitoring"
  target_resource_id         = azurerm_virtual_network_gateway.VnetGW-eus.id
  log_analytics_workspace_id = resource.azurerm_log_analytics_workspace.MSAA-LogAnalytics-r345xqo624z2.id

  log {
    category = "GatewayDiagnosticLog"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "TunnelDiagnosticLog"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "RouteDiagnosticLog"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "IKEDiagnosticLog"
    enabled  = true

    retention_policy {
      enabled = false
    }
  }

  log {
    category = "P2SDiagnosticLog"
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
