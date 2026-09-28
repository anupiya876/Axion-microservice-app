variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "location" {
  description = "Azure region where the VNet will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "vnet_prefix" {
  description = "Address space for the virtual network (e.g. [\"10.0.0.0/8\"])"
  type        = list(string)
}

variable "subnet1_name" {
  description = "Name of the first subnet"
  type        = string
}

variable "subnet1_prefix" {
  description = "Address prefix for the first subnet (e.g. [\"10.0.1.0/24\"])"
  type        = list(string)
}

variable "subnet2_name" {
  description = "Name of the second subnet"
  type        = string
}

variable "subnet2_prefix" {
  description = "Address prefix for the second subnet (e.g. [\"10.0.2.0/24\"])"
  type        = list(string)
}