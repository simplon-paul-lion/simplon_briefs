module "resource_group"{
    source = "../modules_terraform/resource_group"
    name = var.name
    location = var.location

}

module "vnet" {
    source = "../modules_terraform/vnet"
    name = var.name
    location = var.location
    cidr = var.cidr

    depends_on = [ module.resource_group ]
}

module "subnet"{
    source = "../modules_terraform/subnet"
    name = var.name
    address_prefixes = var.address_prefixes
    location = var.location

    depends_on = [ module.resource_group, module.vnet ]
}

module "nsg" {
    source = "../modules_terraform/nsg"
    name = var.name
    location = var.location

    depends_on = [ module.resource_group ]
}

module "public_ip" {
    source = "../modules_terraform/public_ip"
    name = var.name
    location = var.location

    depends_on = [ module.resource_group ]
}

module "nic-nsg" {
  source = "../modules_terraform/nic-nsg"
  nic = module.linux_vm.nic
  nsg = module.nsg.nsg
}

module "linux_vm" {
    source = "../modules_terraform/linux_vm"
    name = var.name
    location = var.location
    subnet_id = module.subnet.subnet_id
    pub_id = module.public_ip.pub_id
}