output "aks_subnet_id" {
  value = [
    for subnet in azurerm_virtual_network.vnet.subnet :
    subnet.id
    if subnet.name == var.subnet1_name
  ][0]
}

output "appgateway_subnet_id" {
  value = [
    for subnet in azurerm_virtual_network.vnet.subnet :
    subnet.id
    if subnet.name == var.subnet2_name
  ][0]
}