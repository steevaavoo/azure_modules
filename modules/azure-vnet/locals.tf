# use locals for loop/conditional logic to make rest of code easier to read
locals {
  nsg_enabled_subnets = {
    # loop through map var
    for key, subnet in var.subnets :
      # contruct what to output into local var
      key => subnet
      # conditional filtering
      if subnet.enable_nsg == "true"
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
