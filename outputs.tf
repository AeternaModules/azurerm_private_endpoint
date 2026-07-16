output "private_endpoints_id" {
  description = "Map of id values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.id if v.id != null && length(v.id) > 0 }
}
output "private_endpoints_custom_dns_configs" {
  description = "Map of custom_dns_configs values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.custom_dns_configs if v.custom_dns_configs != null && length(v.custom_dns_configs) > 0 }
}
output "private_endpoints_custom_network_interface_name" {
  description = "Map of custom_network_interface_name values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.custom_network_interface_name if v.custom_network_interface_name != null && length(v.custom_network_interface_name) > 0 }
}
output "private_endpoints_ip_configuration" {
  description = "Map of ip_configuration values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.ip_configuration if v.ip_configuration != null && length(v.ip_configuration) > 0 }
}
output "private_endpoints_location" {
  description = "Map of location values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.location if v.location != null && length(v.location) > 0 }
}
output "private_endpoints_name" {
  description = "Map of name values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.name if v.name != null && length(v.name) > 0 }
}
output "private_endpoints_network_interface" {
  description = "Map of network_interface values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.network_interface if v.network_interface != null && length(v.network_interface) > 0 }
}
output "private_endpoints_private_dns_zone_configs" {
  description = "Map of private_dns_zone_configs values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.private_dns_zone_configs if v.private_dns_zone_configs != null && length(v.private_dns_zone_configs) > 0 }
}
output "private_endpoints_private_dns_zone_group" {
  description = "Map of private_dns_zone_group values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.private_dns_zone_group if v.private_dns_zone_group != null && length(v.private_dns_zone_group) > 0 }
}
output "private_endpoints_private_service_connection" {
  description = "Map of private_service_connection values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.private_service_connection if v.private_service_connection != null && length(v.private_service_connection) > 0 }
}
output "private_endpoints_resource_group_name" {
  description = "Map of resource_group_name values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "private_endpoints_subnet_id" {
  description = "Map of subnet_id values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.subnet_id if v.subnet_id != null && length(v.subnet_id) > 0 }
}
output "private_endpoints_tags" {
  description = "Map of tags values across all private_endpoints, keyed the same as var.private_endpoints"
  value       = { for k, v in azurerm_private_endpoint.private_endpoints : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

