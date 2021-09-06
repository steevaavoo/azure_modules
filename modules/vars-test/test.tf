# Testing conditional local var
variable "subnets" {
  type = map(map(string))
  default = {
    "subnet1" = {
      address_prefixes = "10.0.1.0/24"
      enable_nsg       = false
    },
    "subnet2" = {
      address_prefixes = "10.0.2.0/24"
      enable_nsg       = true
    },
    "subnet3" = {
      address_prefixes = "10.0.3.0/24"
      enable_nsg       = false
    },
    "subnet4" = {
      address_prefixes = "10.0.4.0/24"
      enable_nsg       = true
    }
  }
}

locals {
  nsg_enabled_subnets = { for key, subnet in var.subnets : key => subnet if subnet.enable_nsg }
}
