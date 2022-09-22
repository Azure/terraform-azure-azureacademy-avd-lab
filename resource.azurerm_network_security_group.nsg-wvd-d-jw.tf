resource "azurerm_network_security_group" "nsg-wvd-d-jw" {
  name                = "nsg-wvd-d-jw"
  location            = azurerm_virtual_network.SpokeVnet-d-jw.location
  resource_group_name = azurerm_resource_group.rg-wth-network-d-eus.name

  security_rule {
    name                       = "Bastian"
    direction                  = "Inbound"
    source_address_prefix      = "10.0.0.128/26"
    source_port_range          = "*"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "3389"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 100
    description                = ""
  }

  security_rule {
    name                       = "InboundICMP"
    direction                  = "Inbound"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "*"
    protocol                   = "Icmp"
    access                     = "Allow"
    priority                   = 110
    description                = ""
  }

  security_rule {
    name                       = "DenyALL"
    direction                  = "Inbound"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "*"
    protocol                   = "*"
    access                     = "Deny"
    priority                   = 4096
    description                = ""
  }
  ############################################################################################
  security_rule {
    name                       = "WVDServiceTraffic"
    direction                  = "Outbound"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
    destination_address_prefix = "WindowsVirtualDesktop"
    destination_port_range     = "443"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 100
    description                = ""
  }

  security_rule {
    name                       = "AzureCloud"
    direction                  = "Outbound"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
    destination_address_prefix = "AzureCloud"
    destination_port_range     = "443"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 110
    description                = ""
  }

  security_rule {
    name                       = "AzureCloud"
    direction                  = "Outbound"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
    destination_address_prefix = "AzureCloud"
    destination_port_range     = "443"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 110
    description                = ""
  }

  security_rule {
    name                       = "AzureKMS"
    direction                  = "Outbound"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
    destination_address_prefix = "23.103.135.246"
    destination_port_range     = "1688"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 120
    description                = ""
  }

  security_rule {
    name                       = "AzureInstanceMetadata"
    direction                  = "Outbound"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
    destination_address_prefix = "169.254.169.254"
    destination_port_range     = "80"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 130
    description                = ""
  }

  security_rule {
    name                       = "VMHealthMonitoring"
    direction                  = "Outbound"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
    destination_address_prefix = "168.63.129.16"
    destination_port_range     = "80"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 140
    description                = ""
  }

  security_rule {
    name                         = "ADRulesTCP"
    direction                    = "Outbound"
    source_address_prefix        = "VirtualNetwork"
    source_port_range            = "*"
    destination_address_prefixes = ["10.0.0.196", "10.0.0.197"]
    destination_port_ranges      = ["53", "88", "135", "389", "445", "464", "636", "49152-65535"]
    protocol                     = "Tcp"
    access                       = "Allow"
    priority                     = 150
    description                  = ""
  }

  security_rule {
    name                         = "ADRulesUDP"
    direction                    = "Outbound"
    source_address_prefix        = "VirtualNetwork"
    source_port_range            = "*"
    destination_address_prefixes = ["10.0.0.196", "10.0.0.197"]
    destination_port_ranges      = ["53", "88", "123", "389", "464", "500", "4500", "49152-65535"]
    protocol                     = "Udp"
    access                       = "Allow"
    priority                     = 160
    description                  = ""
  }

  security_rule {
    name                       = "ICMP"
    direction                  = "Outbound"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "*"
    protocol                   = "Icmp"
    access                     = "Allow"
    priority                   = 170
    description                = ""
  }

  security_rule {
    name                       = "DenyAllOutbound"
    direction                  = "Outbound"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "*"
    protocol                   = "*"
    access                     = "Deny"
    priority                   = 4096
    description                = ""
  }

  tags = {
    Application = "wvdZeroTo140"
    Environment = "Lab"
    CostCenter  = "AZ-140"
    Owner       = "WVD Admin"
  }
}
