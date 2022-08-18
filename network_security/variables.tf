variable "environment" {
  description = "The environment of the resource"
  type        = string
  default     = "dev"
}

variable "location" {
  description = "The location where the resource will be created on"
  type        = string
}

variable "vnet_address_space" {
  description = "AKS Vnet address space"
  type        = string
}

variable "address_prefixes" {
  description = "AKS subnet address prefix"
  type        = list
}
