resource "azurerm_storage_account" "storage_account" {
  name                      = "${var.environment}${var.name}"
  resource_group_name       = var.rgname
  location                  = var.location
  account_tier              = "Standard"
  account_kind              = "StorageV2"
  account_replication_type  = "LRS"
  enable_https_traffic_only = true
  min_tls_version           = "TLS1_2"
  allow_blob_public_access  = true
  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }
  tags = var.tags
}