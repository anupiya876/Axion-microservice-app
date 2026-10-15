resource "azurerm_role_assignment" "pipeline_aks_admin" {
  scope                = var.aks_cluster_id
  role_definition_name = "Azure Kubernetes Service RBAC Admin"
  principal_id         = var.pipeline_sp_object_id
}

resource "azurerm_role_assignment" "pipeline_acr_push" {
  scope                = var.acr_id
  role_definition_name = "AcrPush"
  principal_id         = var.pipeline_sp_object_id
}
