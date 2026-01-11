variable "private_endpoints" {
  description = <<EOT
Map of private_endpoints, attributes below
Required:
    - location
    - name
    - resource_group_name
    - subnet_id
    - private_service_connection (block):
        - is_manual_connection (required)
        - name (required)
        - private_connection_resource_alias (optional)
        - private_connection_resource_id (optional)
        - request_message (optional)
        - subresource_names (optional)
Optional:
    - custom_network_interface_name
    - tags
    - ip_configuration (block):
        - member_name (optional)
        - name (required)
        - private_ip_address (required)
        - subresource_name (optional)
    - private_dns_zone_group (block):
        - name (required)
        - private_dns_zone_ids (required)
EOT

  type = map(object({
    location                      = string
    name                          = string
    resource_group_name           = string
    subnet_id                     = string
    custom_network_interface_name = optional(string)
    tags                          = optional(map(string))
    private_service_connection = object({
      is_manual_connection              = bool
      name                              = string
      private_connection_resource_alias = optional(string)
      private_connection_resource_id    = optional(string)
      request_message                   = optional(string)
      subresource_names                 = optional(list(string))
    })
    ip_configuration = optional(object({
      member_name        = optional(string)
      name               = string
      private_ip_address = string
      subresource_name   = optional(string)
    }))
    private_dns_zone_group = optional(object({
      name                 = string
      private_dns_zone_ids = list(string)
    }))
  }))
}

