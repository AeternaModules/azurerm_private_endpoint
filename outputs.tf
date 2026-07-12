output "private_endpoints_custom_dns_configs" {
  description = "Map of custom_dns_configs values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.custom_dns_configs }
}
output "private_endpoints_custom_network_interface_name" {
  description = "Map of custom_network_interface_name values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.custom_network_interface_name }
}
output "private_endpoints_ip_configuration" {
  description = "Map of ip_configuration values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.ip_configuration }
}
output "private_endpoints_location" {
  description = "Map of location values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.location }
}
output "private_endpoints_name" {
  description = "Map of name values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.name }
}
output "private_endpoints_network_interface" {
  description = "Map of network_interface values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.network_interface }
}
output "private_endpoints_private_dns_zone_configs" {
  description = "Map of private_dns_zone_configs values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.private_dns_zone_configs }
}
output "private_endpoints_private_dns_zone_group" {
  description = "Map of private_dns_zone_group values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.private_dns_zone_group }
}
output "private_endpoints_private_service_connection" {
  description = "Map of private_service_connection values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.private_service_connection }
}
output "private_endpoints_resource_group_name" {
  description = "Map of resource_group_name values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.resource_group_name }
}
output "private_endpoints_subnet_id" {
  description = "Map of subnet_id values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.subnet_id }
}
output "private_endpoints_tags" {
  description = "Map of tags values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.tags }
}

