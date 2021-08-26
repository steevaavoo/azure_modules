resource "azurerm_resource_group" "vnet" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "vnet" {
  for_each             = var.subnet
  name                 = each.key
  resource_group_name  = azurerm_resource_group.vnet.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [each.value]
}

# create an nsg that can support multiple security rules
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet_network_security_group_association


resource "azurerm_network_security_group" "vnet" {
  name                = "steevaavoo-nsg"
  location            = azurerm_resource_group.vnet.location
  resource_group_name = azurerm_resource_group.vnet.name

  # requires dynamic block
  # https://www.terraform.io/docs/language/expressions/dynamic-blocks.html

  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix

    }
  }
}

resource "azurerm_subnet_network_security_group_association" "vnet" {
  for_each                  = azurerm_subnet.vnet
  subnet_id                 = each.value["id"]
  network_security_group_id = azurerm_network_security_group.vnet.id
}
