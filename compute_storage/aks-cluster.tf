
// AKS cluster
module "ecco_aks_cluster" {
  source = "./modules/aks"
  
  name                   = "ecco"
  environment             = var.environment
  rgname                 = data.terraform_remote_state.network_security.outputs.aks_rg_name
  dns_prefix             = var.dns_prefix
  node_count             = var.node_count
  vm_size                = var.vm_size
  kubernetes_version     = "1.24.0"
  tenant_id              = var.tenant_id
  linux_max_pods         = var.linux_max_pods
  os_disk_size_gb        = var.os_disk_size_gb
  nodes_min_count        = var.nodes_min_count
  nodes_max_count        = var.nodes_max_count
  location               = var.location
  subnet                 = data.terraform_remote_state.network_security.outputs.aks_subnet_id
  

  tags = {
    "environment"        = var.environment
    "team"               = "App DevOps"
    "purpose"            = "ecco kubernetes cluster"
  }
}

