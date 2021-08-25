resource "azurerm_resource_group" "vnet" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name
  address_space       = [var.vnet_address_space]

  subnet {
    for_each       = var.subnet
    name           = each.key
    address_prefix = each.value
  }

}
