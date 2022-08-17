module "aks_cluster_sa" {
  source                = "./modules/storage_account"
  name                  = "ecco"
  location              = var.location
  rgname                = module.aks_cluster_rg.resource_group_name

  tags = {
    "environment"       = var.environment
    "team"              = "App DevOps"
    "purpose"           = "storage account for ecco kubernetes cluster"
  }
}