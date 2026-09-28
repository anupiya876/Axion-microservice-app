resource "azurerm_kubernetes_cluster_node_pool" "workernode" {
  name                  = var.node_pool_name
  kubernetes_cluster_id = var.kubernetes_cluster_id
  node_count            = 1
  mode                  = var.node_pool_mode
  vm_size               = var.node_pool_size
  vnet_subnet_id        = var.vnet_subnet_id
}