resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.vnet_prefix

  subnet {
    name             = var.subnet1_name
    address_prefixes = var.subnet1_prefix
  }

  subnet {
    name             = var.subnet2_name
    address_prefixes = var.subnet2_prefix
  }


}