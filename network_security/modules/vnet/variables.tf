variable "name" {
  description = "The name of the vnet"
  type        = string
}

variable "rgname" {
  description = "The resource group name of the vnet"
  type        = string
}

variable "environment" {
  description = "The environment of the vnet"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags to describe the created resource"
  type        = map(string)
  default     = {}
}

variable "location" {
  description = "The location where the resource will be created on"
  type        = string
}
variable "vnet_address_space" {
  description = "The vnet address space"
  type        = string
}

