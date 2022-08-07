resource "azurerm_kubernetes_cluster" "aks" {
  name                = "${var.environment}-${var.name}-aks"
  location            = var.location
  resource_group_name = var.rgname
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  linux_profile {
    admin_username = var.admin_username

    ssh_key {
      key_data = file("${var.environment}-${var.name}-rsa.pub")
    }
  }

  default_node_pool {
    name            = "${var.environment}${var.name}"
    type            = "VirtualMachineScaleSets"
    node_count      = var.node_count
    vm_size         = var.vm_size
    os_disk_size_gb = var.os_disk_size_gb
    vnet_subnet_id  = var.subnet
    max_pods        = var.linux_max_pods
    os_disk_type    = "Ephemeral"
  }

  sku_tier          = var.environment == "prod" ? "Paid" : "Free" 

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
    load_balancer_sku = "Standard"
  }

  private_cluster_enabled = false
  
  role_based_access_control {
    azure_active_directory {
      managed            = true
      azure_rbac_enabled = true
      tenant_id         = var.tenant_id
    }
    enabled = true
  }
  tags = var.tags
}  