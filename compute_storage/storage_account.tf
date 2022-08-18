module "aks_cluster_sa" {
  source                = "./modules/storage_account"
  name                  = "ecco"
  location              = var.location
  rgname                = data.terraform_remote_state.network_security.outputs.aks_rg_name

  tags = {
    "environment"       = var.environment
    "team"              = "App DevOps"
    "purpose"           = "storage account for ecco kubernetes cluster"
  }
}