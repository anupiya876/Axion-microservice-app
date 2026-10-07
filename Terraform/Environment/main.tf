module "resource_group" {
  source   = "../Modules/resource_group"
  name     = "rg-aks-env"
  location = "eastus"
}

module "network" {
  source              = "../Modules/networking"
  depends_on          = [module.resource_group]
  vnet_name           = "aks-vnet"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  vnet_prefix         = ["10.0.0.0/16"]
  subnet1_name        = "aks-subnet"
  subnet1_prefix      = ["10.0.1.0/24"]
  subnet2_name        = "appgateway-subnet"
  subnet2_prefix      = ["10.0.2.0/24"]
}


module "aks" {
  source                 = "../Modules/workload_aks"
  depends_on             = [module.resource_group, module.network]
  cluster_name           = "test-aks-anu"
  location               = module.resource_group.location
  resource_group_name    = module.resource_group.name
  dns_prefix             = "dns-aks-anu"
  tenant_id              = "e5f756dc-95b6-4c55-8fd0-15114f2ec990"
  vnet_subnet_id         = module.network.aks_subnet_id
  application_gateway_id = module.application_gateway.application_gateway_id
}


module "node_pool" {
  source                = "../Modules/aks_node_pool"
  node_pool_name        = "anunode"
  node_pool_mode        = "User"
  node_pool_size        = "Standard_D2alds_v7"
  kubernetes_cluster_id = module.aks.cluster_id
  vnet_subnet_id        = module.network.aks_subnet_id
}

module "public_ip" {
  source = "../Modules/public_ip"

  pip_name            = "aks-pip"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
}

module "application_gateway" {
  source = "../Modules/app-gtw"

  # Application Gateway
  appgw_name          = "appgw-aks-anu"
  location            = module.resource_group.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.network.appgateway_subnet_id

  # Public IP
  public_ip_address_id = module.public_ip.public_ip_id

  # SKU
  appgw_sku_name = "Standard_v2"
  appgw_sku_tier = "Standard_v2"
  appgw_capacity = 1

  # Gateway IP configuration
  gateway_ip_configuration_name = "appgw-ip-config"

  # Frontend
  frontend_ip_configuration_name = "public-frontend"
  frontend_port_name             = "http-port"
  frontend_port                  = 80

  # Backend
  backend_address_pool_name  = "default-backend-pool"
  backend_http_settings_name = "default-http-settings"
  backend_port               = 80
  backend_protocol           = "Http"
  cookie_based_affinity      = "Disabled"

  # Listener
  http_listener_name = "http-listener"
  listener_protocol  = "Http"

  # Routing rule
  routing_rule_name     = "default-routing-rule"
  routing_rule_type     = "Basic"
  routing_rule_priority = 100
}



module "acr" {
  source = "../Modules/acr"

  acr_name            = "anuacr"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  sku                 = "Basic"
}


module "agic_identity" {
  source = "../Modules/agic_identity"

  agic_identity_object_id = module.aks.agic_identity_object_id
  application_gateway_id  = module.application_gateway.application_gateway_id
  resource_group_id       = module.resource_group.id
  aks_cluster_id          = module.aks.cluster_id
  app_gateway_subnet_id   = module.network.appgateway_subnet_id

}


