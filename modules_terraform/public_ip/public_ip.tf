resource "azurerm_public_ip" "pub_ip" {
  name                = format("%s-pub-ip-linux",var.name)
  resource_group_name = var.name
  location            = var.location
  allocation_method   = "Static"
  }