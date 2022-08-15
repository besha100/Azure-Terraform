module "aks-cluster-sa" {
  source                = "./modules/storageAccount"
  name                  = "ecco"
  location              = var.location
  rgname                = module.aks-cluster-rg.resource_group_name

  tags = {
    "environment"       = var.environment
    "team"              = "App DevOps"
    "purpose"           = "storage account for ecco kubernetes cluster"
  }
}