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
  environmet             = var.environment
  rgname                 = module.aks-cluster-rg.name
  dns_prefix             = var.dns_prefix
  node_count             = var.node_count
  vm_size                = var.vm_size
  kubernetes_version     = var.kubernetes_version
  tenant_id              = var.tenant_id
  linux_max_pods         = var.linux_max_pods
  os_disk_size_gb        = var.os_disk_size_gb
  public_ip              = var.public_ip

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    "environment"        = var.environment
    "team"               = "App DevOps"
    "purpose"            = "ecco kubernetes cluster"
  }
}

