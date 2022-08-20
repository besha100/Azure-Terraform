variable "environment" {
  description = "The environment of the resource"
  type        = string
  default     = "dev"
}

variable "dns_prefix" {
  description = "DNS prefix"
  type        = string
}

variable "tenant_id" {
  description = "The tenant ID of the Microsoft Azure account"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the node pool"
  type        = number
  default     = 1
}

variable "nodes_min_count" {
  description = "minimum numbers of nodes to be running on the node pool"
  type        = number
  default     = 1
}

variable "nodes_max_count" {
  description = "maximum numbers of nodes to be running on the node pool"
  type        = number
  default     = 3
}

variable "vm_size" {
  description = "Azure VM size"
  type        = string
  default     = "Standard_B4ms"
}

variable "linux_max_pods" {
  description = "max number of pods in a single node"
  type        = number
  default     = 110
}

variable "os_disk_size_gb" {
  description = "The OS disk size for the nodes"
  type        = number
  default     = 128
}
variable "location" {
  description = "The location where the resource will be created on"
  type        = string
}