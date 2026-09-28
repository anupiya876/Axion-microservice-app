resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "agentpool"
    node_count = 1
    vm_size    = "Standard_D2alds_v7"
    vnet_subnet_id = var.vnet_subnet_id

    upgrade_settings {
    max_surge                     = "10%"
    drain_timeout_in_minutes      = 0
    node_soak_duration_in_minutes = 0
  }
  
  }

    node_provisioning_profile {
    mode               = "Manual"
    default_node_pools = "Auto"
  }

  identity {
    type = "SystemAssigned"
  }

  # Enable AGIC through Terraform
  ingress_application_gateway {
    gateway_id = var.application_gateway_id
  }

  azure_active_directory_role_based_access_control {
    tenant_id         = var.tenant_id
    azure_rbac_enabled = true
  }

  network_profile {
    network_plugin      = "azure"
    network_plugin_mode = "overlay"
    network_policy      = "calico"
    load_balancer_sku   = "standard"
    service_cidr        = "10.1.0.0/16"
    dns_service_ip      = "10.1.0.10"
  }
}



