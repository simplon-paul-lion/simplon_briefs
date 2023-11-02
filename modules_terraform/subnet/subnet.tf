resource "azurerm_subnet" "subnet" {
    name                 = format("%s-subnet-1",var.name, )
    resource_group_name  = var.name
    virtual_network_name = format("%s-vnet",var.name)
    address_prefixes     = var.address_prefixes
  
}