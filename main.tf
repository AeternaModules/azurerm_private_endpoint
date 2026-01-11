resource "azurerm_private_endpoint" "private_endpoints" {
  for_each = var.private_endpoints

  location                      = each.value.location
  name                          = each.value.name
  resource_group_name           = each.value.resource_group_name
  subnet_id                     = each.value.subnet_id
  custom_network_interface_name = each.value.custom_network_interface_name
  tags                          = each.value.tags

  private_service_connection {
    is_manual_connection              = each.value.private_service_connection.is_manual_connection
    name                              = each.value.private_service_connection.name
    private_connection_resource_alias = each.value.private_service_connection.private_connection_resource_alias
    private_connection_resource_id    = each.value.private_service_connection.private_connection_resource_id
    request_message                   = each.value.private_service_connection.request_message
    subresource_names                 = each.value.private_service_connection.subresource_names
  }

  dynamic "ip_configuration" {
    for_each = each.value.ip_configuration != null ? [each.value.ip_configuration] : []
    content {
      member_name        = ip_configuration.value.member_name
      name               = ip_configuration.value.name
      private_ip_address = ip_configuration.value.private_ip_address
      subresource_name   = ip_configuration.value.subresource_name
    }
  }

  dynamic "private_dns_zone_group" {
    for_each = each.value.private_dns_zone_group != null ? [each.value.private_dns_zone_group] : []
    content {
      name                 = private_dns_zone_group.value.name
      private_dns_zone_ids = private_dns_zone_group.value.private_dns_zone_ids
    }
  }
}

