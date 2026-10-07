data "azurerm_client_config" "current" {}

resource "azurerm_role_assignment" "app_gateway_contributor" {
  scope                = var.application_gateway_id
  role_definition_name = "Contributor"
  principal_id         = var.agic_identity_object_id
}

resource "azurerm_role_assignment" "resource_group_reader" {
  scope                = var.resource_group_id
  role_definition_name = "Reader"
  principal_id         = var.agic_identity_object_id
}

resource "azurerm_role_assignment" "aks_rbac_cluster_admin" {
  scope                = var.aks_cluster_id
  role_definition_name = "Azure Kubernetes Service RBAC Cluster Admin"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_role_assignment" "app_gateway_subnet_network_contributor" {
  scope                = var.app_gateway_subnet_id
  role_definition_name = "Network Contributor"
  principal_id         = var.agic_identity_object_id
}