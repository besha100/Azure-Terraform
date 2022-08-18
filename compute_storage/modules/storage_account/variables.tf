variable "name" {
  description = "The name of the storage account"
  type        = string 
}

variable "rgname" {
  description = "The resource group name of the storage account"
  type        = string 
}

variable "environment" {
  description = "The environment of the storage account"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags to describe the created resource"
  type    = map(string)
  default = {}
}

variable "location" {
  description = "The location where the resource will be created on"
  type        = string 
}