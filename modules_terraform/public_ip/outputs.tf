output "pub_ip" {
  value = azurerm_public_ip.pub_ip.ip_address
}

output "pub_id" {
  value = azurerm_public_ip.pub_ip.id
}