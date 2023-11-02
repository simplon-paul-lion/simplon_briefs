output "nic" {
  value = azurerm_network_interface.nic.id
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.redhat.computer_name
}