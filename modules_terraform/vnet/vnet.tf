resource "azurerm_virtual_network" "vnet" {
  name                = format("%s-vnet",var.name)
  resource_group_name = var.name
  location            = var.location
  address_space       = var.cidr
}