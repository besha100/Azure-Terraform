resource "azurerm_virtual_network" "vnet" {
  name                = "${var.environment}-${var.name}-vnet"
  resource_group_name = var.rgname
  location            = var.location
  address_space       = [var.vnet_address_space]
  tags                = var.tags
}

resource "azurerm_subnet" "subnet" {
  for_each = local.subnet
  name                      = each.value.name
  resource_group_name       = each.value.resource_group_name
  address_prefix            = each.value.address_prefix
  virtual_network_name      = azurerm_virtual_network.vnet.name
  service_endpoints         = ["Microsoft.ServiceBus","Microsoft.KeyVault","Microsoft.Sql", "Microsoft.Storage"]
}