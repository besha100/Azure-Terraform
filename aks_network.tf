// AKS VNET
module "aks-cluster-vnet" {
  source                = "./modules/vnet"

  name                  = "ecco"
  rgname                = module.aks-cluster-rg.name
  location              = var.location
  vnet_address_space    = var.vnet_address_space

  tags = {
    "environment"       = var.environment
    "team"              = "App DevOps"
    "purpose"           = "kubernetes cluster virtual network"
  }
}

// AKS Subnet
module "aks-cluster-subnet" {
  source                = "./modules/subnet"

  name                  = "ecco"
  rgname                = module.aks_rg.name
  vnet_name             = module.aks-cluster-vnet.name
  address_prefix        = var.address_prefix
  
  tags = {
    "environment"       = var.environment
    "team"              = "App DevOps"
    "purpose"           = "kubernetes cluster subnet"
  }
}

