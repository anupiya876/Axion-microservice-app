variable "node_pool_name" {
  description = "The name of the additional node pool"
  type        = string
}

variable "node_pool_mode" {
  description = "The mode of the node pool (e.g., User or System)"
  type        = string
  default     = "User"
}


variable "node_pool_size" {
  type = string

}

variable "kubernetes_cluster_id" {
  type = string
}
variable "vnet_subnet_id" {
  type = string
}