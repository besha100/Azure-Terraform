// AKS resource group
module "aks_cluster_rg" {
  source   = "./modules/resource_group"
  name     = "ecco"
  location = var.location

  tags = {
    "environment" = var.environment
    "team"        = "App DevOps"
    "purpose"     = "kubernetes cluster resource group"
  }
}

output "aks_rg_name" {
  value = module.aks_cluster_rg.resource_group_name
}