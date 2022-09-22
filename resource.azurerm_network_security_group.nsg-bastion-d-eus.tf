resource "azurerm_network_security_group" "nsg-bastion-d-eus" {
  name                = "nsg-bastion-d-eus"
  location            = azurerm_resource_group.rg-wth-network-d-eus.location
  resource_group_name = azurerm_resource_group.rg-wth-network-d-eus.name

  security_rule {
    name                       = "AllowBastionClients"
    direction                  = "Inbound"
    source_address_prefix      = "Internet"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 100
    description                = ""
  }

  security_rule {
    name                       = "AllowGatewayManager"
    direction                  = "Inbound"
    source_address_prefix      = "GatewayManager"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 200
    description                = ""
  }

  security_rule {
    name                       = "AllowAzureLoadBalancer"
    direction                  = "Inbound"
    source_address_prefix      = "AzureLoadBalancer"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "443"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 300
    description                = ""
  }

  security_rule {
    name                       = "AllowBastionHostCommunication"
    direction                  = "Inbound"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
    destination_address_prefix = "VirtualNetwork"
    destination_port_ranges    = ["5701", "8080"]
    protocol                   = "*"
    access                     = "Allow"
    priority                   = 400
    description                = ""
  }

  security_rule {
    name                       = "DenyAllInbound"
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
    name                       = "AllowSshRdp"
    direction                  = "Outbound"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "VirtualNetwork"
    destination_port_ranges    = ["22", "3389"]
    protocol                   = "*"
    access                     = "Allow"
    priority                   = 100
    description                = ""
  }

  security_rule {
    name                       = "AllowAzureCloud"
    direction                  = "Outbound"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "AzureCloud"
    destination_port_range     = "443"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 200
    description                = ""
  }

  security_rule {
    name                       = "AllowBastionCommunication"
    direction                  = "Outbound"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
    destination_address_prefix = "VirtualNetwork"
    destination_port_ranges    = ["5701", "8080"]
    protocol                   = "*"
    access                     = "Allow"
    priority                   = 300
    description                = ""
  }

  security_rule {
    name                       = "AllowGetSessionInformation"
    direction                  = "Outbound"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "Internet"
    destination_port_range     = "80"
    protocol                   = "*"
    access                     = "Allow"
    priority                   = 400
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
}
