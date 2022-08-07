module "aks-cluster-rg" {
  source                = "./modules/storageAccount"
  name                  = "ecco"
  location              = var.location
  rgname                = module.aks-cluster-rg.name

  tags = {
    "environment"       = var.environment
    "team"              = "App DevOps"
    "purpose"           = "storage account for ecco kubernetes cluster"
  }
}