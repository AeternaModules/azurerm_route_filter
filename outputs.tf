output "route_filters_id" {
  description = "Map of id values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.id }
}
output "route_filters_location" {
  description = "Map of location values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.location }
}
output "route_filters_name" {
  description = "Map of name values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.name }
}
output "route_filters_resource_group_name" {
  description = "Map of resource_group_name values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.resource_group_name }
}
output "route_filters_rule" {
  description = "Map of rule values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.rule }
}
output "route_filters_tags" {
  description = "Map of tags values across all route_filters, keyed the same as var.route_filters"
  value       = { for k, v in azurerm_route_filter.route_filters : k => v.tags }
}

