resource "azurerm_network_security_group" "nsg-identity-d-eus" {
  name                = "nsg-identity-d-eus"
  location            = azurerm_resource_group.rg-wth-network-d-eus.location
  resource_group_name = azurerm_resource_group.rg-wth-network-d-eus.name

  security_rule {
    name                         = "AllowDomainControllerTcpInbound"
    direction                    = "Inbound"
    source_address_prefix        = "VirtualNetwork"
    source_port_range            = "*"
    destination_address_prefixes = ["10.0.0.196", "10.0.0.197"]
    destination_port_ranges      = ["53", "88", "135", "389", "445", "464", "636", "3268", "3269", "4500", "9389", "49152-65535"]
    protocol                     = "Tcp"
    access                       = "Allow"
    priority                     = 100
    description                  = ""
  }

  security_rule {
    name                         = "AllowDomainControllerUdpInbound"
    direction                    = "Inbound"
    source_address_prefix        = "VirtualNetwork"
    source_port_range            = "*"
    destination_address_prefixes = ["10.0.0.196", "10.0.0.197"]
    destination_port_ranges      = ["53", "88", "123", "389", "464", "500", "4500"]
    protocol                     = "Udp"
    access                       = "Allow"
    priority                     = 200
    description                  = ""
  }

  security_rule {
    name                       = "AllowBastionInbound"
    direction                  = "Inbound"
    source_address_prefix      = "10.0.0.128/26"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "3389"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 300
    description                = ""
  }

  security_rule {
    name                       = "AllowWinrmInbound"
    direction                  = "Inbound"
    source_address_prefix      = "10.0.0.197"
    source_port_range          = "*"
    destination_address_prefix = "10.0.0.196"
    destination_port_range     = "5986"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 400
    description                = "WinRM"
  }

  security_rule {
    name                       = "AllowIcmpInbound"
    direction                  = "Inbound"
    source_address_prefix      = "VirtualNetwork"
    source_port_range          = "*"
    destination_address_prefix = "*"
    destination_port_range     = "*"
    protocol                   = "Icmp"
    access                     = "Allow"
    priority                   = 500
    description                = ""
  }

  security_rule {
    name                       = "AllowAzureLoadBalancerToVirtualNetwork"
    direction                  = "Inbound"
    source_address_prefix      = "AzureLoadBalancer"
    source_port_range          = "*"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "*"
    protocol                   = "*"
    access                     = "Allow"
    priority                   = 600
    description                = "Rule DenyAllInbound may affect VM connectivity. To mitigate, allow AzureLoadBalancer to VirtualNetwork."
  }

  # security_rule {
  #   name                       = "AllowRDPFromMyIP"
  #   direction                  = "Inbound"
  #   source_address_prefix      = var.mypublicipaddress
  #   source_port_range          = "*"
  #   destination_address_prefix = "*"
  #   destination_port_range     = "3389"
  #   protocol                   = "*"
  #   access                     = "Allow"
  #   priority                   = 700
  #   description                = "Allow RDP connections from my IP to identity subnet."
  # }

  # security_rule {
  #   name                       = "DenyAllInbound"
  #   direction                  = "Inbound"
  #   source_address_prefix      = "*"
  #   source_port_range          = "*"
  #   destination_address_prefix = "*"
  #   destination_port_range     = "*"
  #   protocol                   = "*"
  #   access                     = "Deny"
  #   priority                   = 4096
  #   description                = ""
  # }
  ############################################################################################
  security_rule {
    name                         = "AllowDomainControllerTcpOutbound"
    direction                    = "Outbound"
    source_address_prefixes      = ["10.0.0.196", "10.0.0.197"]
    source_port_range            = "*"
    destination_address_prefixes = ["10.0.0.196", "10.0.0.197"]
    destination_port_ranges      = ["53", "88", "135", "389", "445", "464", "636", "3268", "3269", "4500", "9389", "49152-65535"]
    protocol                     = "Tcp"
    access                       = "Allow"
    priority                     = 100
    description                  = ""
  }

  security_rule {
    name                         = "AllowDomainControllerUdpOutbound"
    direction                    = "Outbound"
    source_address_prefixes      = ["10.0.0.196", "10.0.0.197"]
    source_port_range            = "*"
    destination_address_prefixes = ["10.0.0.196", "10.0.0.197"]
    destination_port_ranges      = ["53", "88", "123", "389", "464", "500", "4500"]
    protocol                     = "Udp"
    access                       = "Allow"
    priority                     = 200
    description                  = ""
  }

  security_rule {
    name                       = "AllowWinrmOutbound"
    direction                  = "Outbound"
    source_address_prefix      = "10.0.0.197"
    source_port_range          = "*"
    destination_address_prefix = "10.0.0.196"
    destination_port_range     = "5986"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 300
    description                = "WinRM"
  }

  security_rule {
    name                       = "AllowInternetOutbound"
    direction                  = "Outbound"
    source_address_prefixes    = ["10.0.0.196", "10.0.0.197"]
    source_port_range          = "*"
    destination_address_prefix = "Internet"
    destination_port_ranges    = ["80", "443"]
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 400
    description                = ""
  }

  security_rule {
    name                       = "AllowSmbOutbound"
    direction                  = "Outbound"
    source_address_prefix      = "*"
    source_port_range          = "*"
    destination_address_prefix = "VirtualNetwork"
    destination_port_range     = "445"
    protocol                   = "Tcp"
    access                     = "Allow"
    priority                   = 500
    description                = ""
  }

  # security_rule {
  #   name                       = "DenyAllOutbound"
  #   direction                  = "Outbound"
  #   source_address_prefix      = "*"
  #   source_port_range          = "*"
  #   destination_address_prefix = "*"
  #   destination_port_range     = "*"
  #   protocol                   = "*"
  #   access                     = "Deny"
  #   priority                   = 4096
  #   description                = ""
  # }
}

# *) In nsg-identity-d-eus, rule named DenyAllInbound may affect virtual machine connectivity. To allow access, add an inbound rule with higher priority to allow AzureLoadBalancer to VirtualNetwork.
# *) In nsg-identity-d-eus, rule named AllowDomainControllerTcpOutbound has the protocol type set to Any. It should be TCP
