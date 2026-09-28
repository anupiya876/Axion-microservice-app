output "application_gateway_id" {
  value = azurerm_application_gateway.appgw.id
}

output "frontend_ip_configuration_id" {
  value = azurerm_application_gateway.appgw.frontend_ip_configuration[0].id
}