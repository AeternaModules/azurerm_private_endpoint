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
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        length(v.name) != 1
      )
    ])
    error_message = "[from validate.PrivateLinkName: invalid when len(value) == 1]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        v.private_dns_zone_group == null || (length(v.private_dns_zone_group.name) != 1)
      )
    ])
    error_message = "[from validate.PrivateLinkName: invalid when len(value) == 1]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        length(v.private_service_connection.name) != 1
      )
    ])
    error_message = "[from validate.PrivateLinkName: invalid when len(value) == 1]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        v.private_service_connection.subresource_names == null || (alltrue([for x in v.private_service_connection.subresource_names : length(x) == 0]))
      )
    ])
    error_message = "[from validate.PrivateLinkSubResourceName: invalid when len(value) != 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        v.private_service_connection.request_message == null || (length(v.private_service_connection.request_message) >= 1 && length(v.private_service_connection.request_message) <= 140)
      )
    ])
    error_message = "must be between 1 and 140 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        v.ip_configuration == null || alltrue([for item in v.ip_configuration : (length(item.name) != 1)])
      )
    ])
    error_message = "[from validate.PrivateLinkName: invalid when len(value) == 1]"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        v.ip_configuration == null || alltrue([for item in v.ip_configuration : (length(item.private_ip_address) > 0)])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        v.ip_configuration == null || alltrue([for item in v.ip_configuration : (item.subresource_name == null || (length(item.subresource_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        v.ip_configuration == null || alltrue([for item in v.ip_configuration : (item.member_name == null || (length(item.member_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.private_endpoints : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 28 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

