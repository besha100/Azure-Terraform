variable "name" {
  description = "The name of the resource group"
  type        = string
}

variable "environment" {
  description = "The environment of the resource group"
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