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
  type        = list(any)
  default     = ["10.0.0.0/16"]
}

variable "subnet" {
  type = map(string)
  default = {
    "subnet1" = "10.0.1.0/24"
    "subnet2" = "10.0.2.0/24"
    "subnet3" = "10.0.3.0/24"
    "subnet4" = "10.0.4.0/24"
  }
}

variable "nsg_rules" {
  type = list(any)
  default = [{
    name                   = "rule1"
    priority               = 100
    direction              = "Inbound"
    access                 = "Allow"
    protocol               = "Tcp"
    source_port_range      = "*"
    destination_port_range = "443"
    source_address_prefix  = "*"
    destination_address_prefix = "*" },
    {
      name                   = "rule2"
      priority               = 200
      direction              = "Inbound"
      access                 = "Allow"
      protocol               = "Tcp"
      source_port_range      = "*"
      destination_port_range = "587"
      source_address_prefix  = "*"
    destination_address_prefix = "*" }
  ]
}
