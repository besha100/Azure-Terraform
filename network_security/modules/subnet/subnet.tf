resource "azurerm_subnet" "subnet" {
  name                      = "${var.environment}_${var.name}_subnet"
  resource_group_name       = var.rgname
  address_prefixes            = var.address_prefixes
  virtual_network_name      = var.vnet_name
  service_endpoints         = ["Microsoft.ServiceBus","Microsoft.KeyVault","Microsoft.Sql", "Microsoft.Storage"]
}