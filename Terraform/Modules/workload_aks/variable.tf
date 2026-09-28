variable "cluster_name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The Azure region where the AKS cluster will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the AKS cluster"
  type        = string
}


variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "vnet_subnet_id" {
  type = string
}

variable "application_gateway_id" {
  description = "Resource ID of the Application Gateway for AGIC"
  type        = string
}