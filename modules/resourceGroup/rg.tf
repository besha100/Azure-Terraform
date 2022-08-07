# ecco aks environemnt resource group
resource "azurerm_resource_group" "resource_group" {
  name     = "${var.environment}-${var.name}-rg"
  location = var.location
  tags     = var.tags
}