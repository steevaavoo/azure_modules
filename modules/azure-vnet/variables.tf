variable "location" {
  description = "Location of resource(s)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of Azure Resource Group"
  type        = string
}

variable "vnet_name" {
  description = "Name of Azure Virtual Network"
  type        = string
}

variable "vnet_address_space" {
  description = "Azure Virtual Network Address Space"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet" {
  type = map(string)
  default = {
    "subnet1" = "10.0.1.0/24"
    "subnet2" = "10.0.2.0/24"
    "subnet3" = "10.0.3.0/24"
  }
}
