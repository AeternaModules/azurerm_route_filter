variable "route_filters" {
  description = <<EOT
Map of route_filters, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - rule (block):
        - access (optional)
        - communities (optional)
        - name (optional)
        - rule_type (optional)
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    rule = optional(list(object({
      access      = optional(string)
      communities = optional(list(string))
      name        = optional(string)
      rule_type   = optional(string)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.route_filters : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_filters : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_filters : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_filters : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_filters : (
        v.rule == null || alltrue([for item in v.rule : (item.name == null || (length(item.name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_filters : (
        v.rule == null || alltrue([for item in v.rule : (item.rule_type == null || (contains(["Community"], item.rule_type)))])
      )
    ])
    error_message = "must be one of: Community"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_filters : (
        v.rule == null || alltrue([for item in v.rule : (item.communities == null || (alltrue([for x in item.communities : length(x) > 0])))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.route_filters : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

