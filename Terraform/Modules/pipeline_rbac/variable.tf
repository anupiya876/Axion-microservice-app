variable "aks_cluster_id" {
  description = "Resource ID of the AKS cluster"
  type        = string
}

variable "acr_id" {
  description = "Resource ID of the Azure Container Registry"
  type        = string
}

variable "pipeline_sp_object_id" {
  description = "Object ID of the ADO pipeline service principal (axion-ado-deploy-sp)"
  type        = string
}
