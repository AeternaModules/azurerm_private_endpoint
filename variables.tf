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
    ip_configuration = optional(list(object({
      member_name        = optional(string)
      name               = string
      private_ip_address = string
      subresource_name   = optional(string)
    })))
    private_dns_zone_group = optional(object({
      name                 = string
      private_dns_zone_ids = list(string)
    }))
  }))
  # --- Unconfirmed validation candidates, derived from azurerm_private_endpoint's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.PrivateLinkName] !ok
  # path: name
  #   condition: length(value) != 1
  #   message:   [from validate.PrivateLinkName: invalid when len(value) == 1]
  #   source:    [from validate.PrivateLinkName: invalid when len(value) == 1]
  # path: name
  #   source:    [from validate.PrivateLinkName] !m
  # path: name
  #   source:    [from validate.PrivateLinkName] !m
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: subnet_id
  #   source:    [from commonids.ValidateSubnetID] !ok
  # path: subnet_id
  #   source:    [from commonids.ValidateSubnetID] err != nil
  # path: private_dns_zone_group.name
  #   source:    [from validate.PrivateLinkName] !ok
  # path: private_dns_zone_group.name
  #   condition: length(value) != 1
  #   message:   [from validate.PrivateLinkName: invalid when len(value) == 1]
  #   source:    [from validate.PrivateLinkName: invalid when len(value) == 1]
  # path: private_dns_zone_group.name
  #   source:    [from validate.PrivateLinkName] !m
  # path: private_dns_zone_group.name
  #   source:    [from validate.PrivateLinkName] !m
  # path: private_dns_zone_group.private_dns_zone_ids[*]
  #   source:    [from privatezones.ValidatePrivateDnsZoneID] !ok
  # path: private_dns_zone_group.private_dns_zone_ids[*]
  #   source:    [from privatezones.ValidatePrivateDnsZoneID] err != nil
  # path: private_service_connection.name
  #   source:    [from validate.PrivateLinkName] !ok
  # path: private_service_connection.name
  #   condition: length(value) != 1
  #   message:   [from validate.PrivateLinkName: invalid when len(value) == 1]
  #   source:    [from validate.PrivateLinkName: invalid when len(value) == 1]
  # path: private_service_connection.name
  #   source:    [from validate.PrivateLinkName] !m
  # path: private_service_connection.name
  #   source:    [from validate.PrivateLinkName] !m
  # path: private_service_connection.private_connection_resource_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: private_service_connection.private_connection_resource_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: private_service_connection.private_connection_resource_alias
  #   source:    [from validate.PrivateConnectionResourceAlias] !ok
  # path: private_service_connection.private_connection_resource_alias
  #   source:    [from validate.PrivateConnectionResourceAlias] !strings.HasSuffix(v, ".azure.privatelinkservice")
  # path: private_service_connection.subresource_names[*]
  #   source:    [from validate.PrivateLinkSubResourceName] !ok
  # path: private_service_connection.subresource_names[*]
  #   condition: length(value) < 3
  #   message:   [from validate.PrivateLinkSubResourceName: invalid when len(value) >= 3]
  #   source:    [from validate.PrivateLinkSubResourceName: invalid when len(value) >= 3]
  # path: private_service_connection.subresource_names[*]
  #   source:    [from validate.PrivateLinkSubResourceName] !m
  # path: private_service_connection.subresource_names[*]
  #   condition: length(value) == 0
  #   message:   [from validate.PrivateLinkSubResourceName: invalid when len(value) != 0]
  #   source:    [from validate.PrivateLinkSubResourceName: invalid when len(value) != 0]
  # path: private_service_connection.request_message
  #   condition: length(value) >= 1 && length(value) <= 140
  #   message:   must be between 1 and 140 characters
  # path: ip_configuration.name
  #   source:    [from validate.PrivateLinkName] !ok
  # path: ip_configuration.name
  #   condition: length(value) != 1
  #   message:   [from validate.PrivateLinkName: invalid when len(value) == 1]
  #   source:    [from validate.PrivateLinkName: invalid when len(value) == 1]
  # path: ip_configuration.name
  #   source:    [from validate.PrivateLinkName] !m
  # path: ip_configuration.name
  #   source:    [from validate.PrivateLinkName] !m
  # path: ip_configuration.private_ip_address
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: ip_configuration.subresource_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: ip_configuration.member_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

