# ecco aks environemnt resource group
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.environment}_${var.name}_rg"
  location = var.location
  tags     = var.tags
}