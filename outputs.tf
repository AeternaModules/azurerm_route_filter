output "route_filters_id" {
  description = "Map of id values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.id if v.id != null && length(v.id) > 0 }
}
output "route_filters_location" {
  description = "Map of location values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.location if v.location != null && length(v.location) > 0 }
}
output "route_filters_name" {
  description = "Map of name values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.name if v.name != null && length(v.name) > 0 }
}
output "route_filters_resource_group_name" {
  description = "Map of resource_group_name values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "route_filters_rule" {
  description = "Map of rule values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.rule if v.rule != null && length(v.rule) > 0 }
}
output "route_filters_tags" {
  description = "Map of tags values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

