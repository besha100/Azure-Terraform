resource "azurerm_network_security_group" "nw_nsg_group" {
  name                = "${var.environment}-${var.name}-nsg"
  location            = var.location
  resource_group_name = var.rg_name
  tags                = var.tags
}


resource "azurerm_network_security_rule" "custom_rules" {
  for_each = local.custom_rules

  name                                       = each.value.name
  priority                                   = each.value.priority
  direction                                  = each.value.direction
  access                                     = each.value.access
  protocol                                   = each.value.protocol
  source_port_ranges                         = each.value.source_port_ranges
  destination_port_ranges                    = each.value.destination_port_ranges
  description                                = each.value.description
  source_address_prefix                      = each.value.source_address_prefix
  source_address_prefixes                    = each.value.source_address_prefixes
  destination_address_prefix                 = each.value.destination_address_prefix
  destination_address_prefixes               = each.value.destination_address_prefixes
  resource_group_name                        = data.azurerm_resource_group.rg.name
  network_security_group_name                = azurerm_network_security_group.security_group.name
  source_application_security_group_ids      = each.value.source_application_security_group_ids
  destination_application_security_group_ids = each.value.destination_application_security_group_ids
}


resource "azurerm_subnet_network_security_group_association" "nw_nsg_group" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.security_group.id
}