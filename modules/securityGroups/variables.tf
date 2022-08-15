variable "name" {
  description = "The name of the security group"
  type        = string 
}

variable "rgname" {
  description = "The resource group name of the security group"
  type        = string 
}

variable "environment" {
  description = "The environment of the security group"
  type        = string
  default     = "dev"
}

variable "tags" {
  description = "Tags to describe the created resource"
  type    = map(string)
  default = {}
}

variable "subnet_id" {
  description = "The subnet ID associated with the security group"
  type        = string
}

variable "location" {
  description = "The location where the resource will be created on"
  type        = string 
}

variable "custom_rules" {
  description = "List of objects defining security group custom rules"
  type = list(object({
    name                                       = string
    priority                                   = number
    direction                                  = string
    access                                     = string
    protocol                                   = string
    source_port_range                          = string
    destination_port_range                     = string
    description                                = string
    source_address_prefix                      = string
    destination_address_prefix                 = string
    resource_group_name                        = string
    }))
  }