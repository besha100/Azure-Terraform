terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "<= 2.99.0"
    }
  }
  # Azure storage account details setup in Step 2 to store the state file
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstate27584"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    }
}

provider "azurerm" {
  features {}
}

