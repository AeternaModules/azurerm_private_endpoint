output "private_endpoints" {
  description = "All private_endpoint resources"
  value       = azurerm_private_endpoint.private_endpoints
}
output "private_endpoints_custom_dns_configs" {
  description = "List of custom_dns_configs values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.custom_dns_configs]
}
output "private_endpoints_custom_network_interface_name" {
  description = "List of custom_network_interface_name values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.custom_network_interface_name]
}
output "private_endpoints_ip_configuration" {
  description = "List of ip_configuration values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.ip_configuration]
}
output "private_endpoints_location" {
  description = "List of location values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.location]
}
output "private_endpoints_name" {
  description = "List of name values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.name]
}
output "private_endpoints_network_interface" {
  description = "List of network_interface values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.network_interface]
}
output "private_endpoints_private_dns_zone_configs" {
  description = "List of private_dns_zone_configs values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.private_dns_zone_configs]
}
output "private_endpoints_private_dns_zone_group" {
  description = "List of private_dns_zone_group values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.private_dns_zone_group]
}
output "private_endpoints_private_service_connection" {
  description = "List of private_service_connection values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.private_service_connection]
}
output "private_endpoints_resource_group_name" {
  description = "List of resource_group_name values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.resource_group_name]
}
output "private_endpoints_subnet_id" {
  description = "List of subnet_id values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.subnet_id]
}
output "private_endpoints_tags" {
  description = "List of tags values across all private_endpoints"
  value       = [for k, v in azurerm_private_endpoint.private_endpoints : v.tags]
}

