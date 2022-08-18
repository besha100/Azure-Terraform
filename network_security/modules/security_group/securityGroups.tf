resource "azurerm_network_security_group" "nw_nsg_group" {
  name                = "${var.environment}_${var.name}_nsg"
  location            = var.location
  resource_group_name = var.rgname
  tags                = var.tags
}


resource "azurerm_network_security_rule" "custom_rules" {
  count = length(var.custom_rules)

  name                                       = var.custom_rules[count.index].name
  priority                                   = var.custom_rules[count.index].priority
  direction                                  = var.custom_rules[count.index].direction
  access                                     = var.custom_rules[count.index].access
  protocol                                   = var.custom_rules[count.index].protocol
  source_port_range                          = var.custom_rules[count.index].source_port_range
  destination_port_range                     = var.custom_rules[count.index].destination_port_range
  description                                = var.custom_rules[count.index].description
  source_address_prefix                      = var.custom_rules[count.index].source_address_prefix
  destination_address_prefix                 = var.custom_rules[count.index].destination_address_prefix
  resource_group_name                        = var.rgname
  network_security_group_name                = azurerm_network_security_group.nw_nsg_group.name
}


resource "azurerm_subnet_network_security_group_association" "nw_nsg_group" {
  subnet_id                 = var.subnet_id
  network_security_group_id = azurerm_network_security_group.nw_nsg_group.id
}