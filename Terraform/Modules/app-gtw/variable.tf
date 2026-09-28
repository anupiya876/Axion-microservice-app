variable "appgw_name" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "public_ip_address_id" {
  type = string
}

variable "appgw_sku_name" {
  type = string
}

variable "appgw_sku_tier" {
  type = string
}

variable "gateway_ip_configuration_name" {
  type = string
}

variable "frontend_port_name" {
  type = string
}

variable "frontend_port" {
  type = number
}

variable "frontend_ip_configuration_name" {
  type = string
}

variable "backend_address_pool_name" {
  type = string
}

variable "backend_http_settings_name" {
  type = string
}

variable "backend_port" {
  type = number
}

variable "backend_protocol" {
  type = string
}

variable "cookie_based_affinity" {
  type = string
}

variable "http_listener_name" {
  type = string
}

variable "listener_protocol" {
  type = string
}

variable "routing_rule_name" {
  type = string
}

variable "routing_rule_type" {
  type = string
}

variable "routing_rule_priority" {
  type = number
}

variable "appgw_capacity" {
  type = number
}