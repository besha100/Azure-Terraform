module "aks_cluster_sg" {
  source = "./modules/security_group"

  name      = "ecco"
  rgname    = module.aks_cluster_rg.resource_group_name
  location  = var.location
  subnet_id = module.aks_cluster_subnet.subnet_id
  custom_rules = [
    {
      name                       = "https"
      priority                   = 1000
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "tcp"
      source_port_range          = "*"
      source_address_prefix      = "Internet"
      destination_port_range     = "443"
      source_address_prefixes    = "*"
      destination_address_prefix = "*"
      resource_group_name        = module.aks_cluster_rg.resource_group_name
      description                = "Allow_ingress_https"
    }
  ]

  tags = {
    "environment" = var.environment
    "team"        = "App DevOps"
    "purpose"     = "kubernetes cluster network"
  }
}