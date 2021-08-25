output "resource_group" {
  description = "Full details of Resource Group"
  value       = azurerm_resource_group.vnet
}

output "vnet" {
  description = "Full details of Azure Virtual Network"
  value       = azurerm_virtual_network.vnet
}
