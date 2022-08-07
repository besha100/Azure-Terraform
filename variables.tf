variable "environment" {
}

variable "location" {
}

variable "dns_prefix" {
}

variable "node_count" {
}

variable "max_pods" {
}

variable "linux_max_pods" {
}

variable "os_disk_size_gb" {
}

variable "vm_size" {
}

variable "kubernetes_version" {
}

variable "vnet_address_space" {
}

variable "subnet_address_prefix" {
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "tenant_id" {
}