resource "azurerm_network_interface_security_group_association" "nic-nsg" {
  network_interface_id      = var.nic
  network_security_group_id = var.nsg
}