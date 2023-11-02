resource "local_file" "kube_config" {
  content  = azurerm_kubernetes_cluster.aks.kube_config_raw
  filename = ".kube/config"
}