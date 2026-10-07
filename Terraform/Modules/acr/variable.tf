variable "acr_name" {
  description = "Name of the Azure Container Registry (globally unique, alphanumeric only)"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group to deploy the ACR into"
  type        = string
}

variable "location" {
  description = "Azure region for the ACR"
  type        = string
}

variable "sku" {
  description = "ACR SKU tier (Basic, Standard, Premium)"
  type        = string
  default     = "Basic"
}
