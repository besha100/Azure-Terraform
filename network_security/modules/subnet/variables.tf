variable "name" {
  description = "The name of the subnet"
  type        = string 
}

variable "rgname" {
  description = "The resource group name of the subnet"
  type        = string 
}

variable "environment" {
  description = "The environment of the subnet"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags to describe the created resource"
  type    = map(string)
  default = {}
}

variable "address_prefixes" {
  description = "The address prefixes of the subnet"
  type        = list
}

variable "vnet_name" {
  description = "The vnet name of the subnet"
  type        = string
}