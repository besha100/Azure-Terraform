resource "azurerm_virtual_network" "vnet" {
  name                = "${var.environment}_${var.name}_vnet"
  resource_group_name = var.rgname
  location            = var.location
  address_space       = [var.vnet_address_space]
  tags                = var.tags
}