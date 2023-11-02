resource "azurerm_network_security_group" "nsg" {
  name                = format("%s-nsg",var.name)
  location            = var.location
  resource_group_name = var.name

  security_rule {
    name                       = "nsg-rule"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_ranges    = ["22"]
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}