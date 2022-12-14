// AKS VNET
module "aks_cluster_vnet" {
  source = "./modules/vnet"

  name               = "ecco"
  rgname             = module.aks_cluster_rg.resource_group_name
  location           = var.location
  vnet_address_space = var.vnet_address_space

  tags = {
    "environment" = var.environment
    "team"        = "App DevOps"
    "purpose"     = "kubernetes cluster virtual network"
  }
}

// AKS Subnet
module "aks_cluster_subnet" {
  source = "./modules/subnet"

  name             = "ecco"
  rgname           = module.aks_cluster_rg.resource_group_name
  vnet_name        = module.aks_cluster_vnet.vnet_name
  address_prefixes = var.address_prefixes

  tags = {
    "environment" = var.environment
    "team"        = "App DevOps"
    "purpose"     = "kubernetes cluster subnet"
  }
}

output "aks_subnet_id" {
  value = module.aks_cluster_subnet.subnet_id
}