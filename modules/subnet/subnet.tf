resource "azurerm_subnet" "subnet" {
  name                      = "${var.environment}-${var.name}-subnet"
  resource_group_name       = var.rgname
  address_prefix            = var.address_prefix
  virtual_network_name      = var.vnet_name
  service_endpoints         = ["Microsoft.ServiceBus","Microsoft.KeyVault","Microsoft.Sql", "Microsoft.Storage"]
}