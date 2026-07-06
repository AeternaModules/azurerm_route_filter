output "route_filters" {
  description = "All route_filter resources"
  value       = azurerm_route_filter.route_filters
}
output "route_filters_location" {
  description = "List of location values across all route_filters"
  value       = [for k, v in azurerm_route_filter.route_filters : v.location]
}
output "route_filters_name" {
  description = "List of name values across all route_filters"
  value       = [for k, v in azurerm_route_filter.route_filters : v.name]
}
output "route_filters_resource_group_name" {
  description = "List of resource_group_name values across all route_filters"
  value       = [for k, v in azurerm_route_filter.route_filters : v.resource_group_name]
}
output "route_filters_rule" {
  description = "List of rule values across all route_filters"
  value       = [for k, v in azurerm_route_filter.route_filters : v.rule]
}
output "route_filters_tags" {
  description = "List of tags values across all route_filters"
  value       = [for k, v in azurerm_route_filter.route_filters : v.tags]
}

