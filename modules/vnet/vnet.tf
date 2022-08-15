resource "azurerm_virtual_network" "vnet" {
  name                = "${var.environment}-${var.name}-vnet"
  resource_group_name = var.rgname
  location            = var.location
  address_space       = [var.vnet_address_space]
  tags                = var.tags
}