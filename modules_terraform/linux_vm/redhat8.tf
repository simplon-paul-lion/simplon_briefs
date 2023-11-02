
resource "azurerm_network_interface" "nic" {
  name                = format("%s-nic",var.name)
  location            = var.location
  resource_group_name = var.name

  ip_configuration {
    name                          = format("%s-nic-config",var.name)
    subnet_id                     = var.subnet_id
    public_ip_address_id = var.pub_id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.0.1.6"
  }
}

resource "azurerm_linux_virtual_machine" "redhat" {
  name                = format("%s-vm",var.name)
  resource_group_name = var.name
  location            = var.location
  size                = "Standard_D2_v2"
  admin_username      = "ansible"
  network_interface_ids = [azurerm_network_interface.nic.id]

  admin_ssh_key {
    username   = "ansible"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    name = format("%s-vmos",var.name)
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8-LVM"
    version   = "8.8.2023081717"
  }

   provisioner "local-exec" {
  command = "ansible-galaxy install -r requirements.yaml"
  }
  provisioner "local-exec" {
  command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook playbook.yaml -i azure_rm.yaml"
  }
}