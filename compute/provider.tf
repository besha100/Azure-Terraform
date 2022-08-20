terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "<= 2.99.0"
    }
  }
  # Azure storage account details setup in Step 2 to store the state file
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate27584"
    container_name       = "tfstate"
    key                  = "compute_storage.tfstate"
  }
}

# Data From Existing Infrastructure in a different terraform layer
data "terraform_remote_state" "network_security" {
  backend = "azurerm"

  config = {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate27584"
    container_name       = "tfstate"
    key                  = "network_security.tfstate"
  }
}


provider "azurerm" {
  features {}
}

