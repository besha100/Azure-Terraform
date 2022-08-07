module "aks-cluster-sg" {
  source                = "./modules/securityGroups"

  name                  = "ecco"
  rgname                = module.aks-cluster-rg.name
  location              = var.location
  custom_rules          = [
    {
      name                    = "https"
      priority                = 1000
      direction               = "Inbound"
      access                  = "Allow"
      protocol                = "tcp"
      source_port_range       = "*"
      destination_port_range  = "443"
      source_address_prefixes = "*"
      description             = "Allow-ingress-http"
    },
  ]

  tags = {
    "environment"       = var.environment
    "team"              = "App DevOps"
    "purpose"           = "kubernetes cluster network"
  }
}