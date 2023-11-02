resource "azurerm_kubernetes_cluster" "aks" {
  name                = format("%s-aks", var.name)
  location            = var.location
  resource_group_name = var.name
  dns_prefix          = format("%s-aks", var.name)

  default_node_pool {
    name       = var.aks_node_pool_config.default.name
    node_count = var.aks_node_pool_config.default.node_count
    vm_size    = var.aks_node_pool_config.default.vm_size
  }

  identity {
    type = "SystemAssigned"
  }
}

