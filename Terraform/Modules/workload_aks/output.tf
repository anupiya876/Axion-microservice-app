output "cluster_id" {
  description = "The ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}

output "managed_resource_group_id" {
  description = "Resource ID of the AKS managed resource group"
  value       = azurerm_kubernetes_cluster.aks.node_resource_group_id
}

output "managed_resource_group_name" {
  description = "Name of the AKS managed resource group"
  value       = azurerm_kubernetes_cluster.aks.node_resource_group
}

output "agic_identity_object_id" {
  description = "Object ID of the AGIC managed identity"
  value       = azurerm_kubernetes_cluster.aks.ingress_application_gateway[0].ingress_application_gateway_identity[0].object_id
}