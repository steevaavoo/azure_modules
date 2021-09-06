# Testing conditional local var
variable "subnets" {
  type = map(map(string))
  default = {
    "subnet1" = {
      name             = "sub1"
      address_prefixes = "10.0.1.0/24"
      enable_nsg       = "false"
    },
    "subnet2" = {
      name             = "sub2"
      address_prefixes = "10.0.2.0/24"
      enable_nsg       = "true"
    },
    "subnet3" = {
      name             = "sub3"
      address_prefixes = "10.0.3.0/24"
      enable_nsg       = "false"
    },
    "subnet4" = {
      name             = "sub4"
      address_prefixes = "10.0.4.0/24"
      enable_nsg       = "true"
    }
  }
}

# use locals for loop/conditional logic to make rest of code easier to read
locals {
  nsg_enabled_subnets = {
    # loop through map var
    for key, subnet in var.subnets :
      # contruct what to output into local var
      key => subnet
      # conditional filtering
      if subnet.enable_nsg
  }

  nsg_disabled_subnets = {
    # loop through map var
    for key, subnet in var.subnets :
      # contruct what to output into local var
      key => subnet
      # conditional filtering
      if subnet.enable_nsg == "false"
  }
}
