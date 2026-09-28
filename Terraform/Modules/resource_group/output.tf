output "name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.aks.name
}

output "location" {
  description = "The location of the resource group"
  value       = azurerm_resource_group.aks.location
}

output "id" {
  description = "The ID of the resource group"
  value       = azurerm_resource_group.aks.id
}