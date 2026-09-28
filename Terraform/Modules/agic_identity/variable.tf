variable "agic_identity_object_id" {
  description = "Object ID of the AGIC managed identity created by the AKS add-on"
  type        = string
}

variable "application_gateway_id" {
  description = "Resource ID of the Application Gateway"
  type        = string
}

variable "resource_group_id" {
  description = "Resource ID of the AKS resource group"
  type        = string
}

variable "aks_cluster_id" {
  description = "Resource ID of the AKS cluster"
  type        = string
}
variable "app_gateway_subnet_id" {
  description = "Resource ID of the Application Gateway subnet"
  type        = string
}