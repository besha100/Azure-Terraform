// AKS resource group
module "aks-cluster-rg" {
  source                = "./modules/resourceGroup"
  name                  = "ecco"
  location              = var.location

  tags = {
    "environment"       = var.environment
    "team"              = "App DevOps"
    "purpose"           = "kubernetes cluster resource group"
  }
}


// AKS cluster
module "ecco-aks-cluster" {
  source = "./modules/aks"
  
  name                   = "ecco"
  environment             = var.environment
  rgname                 = module.aks-cluster-rg.resource_group_name
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
  subnet                 = module.aks-cluster-subnet.subnet_id
  

  tags = {
    "environment"        = var.environment
    "team"               = "App DevOps"
    "purpose"            = "ecco kubernetes cluster"
  }
}

