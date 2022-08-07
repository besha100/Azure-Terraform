variable "environment" {
}

variable "dns_prefix" {
}

variable "tenant_id" {
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "kubernetes_version" {
}

variable "node_count" {
}

variable "vm_size" {
}

variable "linux_max_pods" {
}

variable "os_disk_size_gb" {
}

variable "subnet" {
}

variable "location" {
}

variable "name" {
}

variable "rgname" {
}