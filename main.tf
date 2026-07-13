resource "azurerm_route_filter" "route_filters" {
  for_each = var.route_filters

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "rule" {
    for_each = each.value.rule != null ? each.value.rule : []
    content {
      access      = rule.value.access
      communities = rule.value.communities
      name        = rule.value.name
      rule_type   = rule.value.rule_type
    }
  }
}

