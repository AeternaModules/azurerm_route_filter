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
        - access (required)
        - communities (required)
        - name (required)
        - rule_type (required)
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    rule = optional(object({
      access      = string
      communities = list(string)
      name        = string
      rule_type   = string
    }))
  }))
}

