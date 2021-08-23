resource "azurerm_resource_group" "sc" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "sc" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.sc.name
  location                 = azurerm_resource_group.sc.location
  account_tier             = "Standard"
  account_replication_type = var.account_replication_type
  allow_blob_public_access = true

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "sc" {
  name                  = var.storage_container_name
  storage_account_name  = azurerm_storage_account.sc.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "sc" {
  name                   = var.blob_filename
  storage_account_name   = azurerm_storage_account.sc.name
  storage_container_name = azurerm_storage_container.sc.name
  type                   = var.blob_type
  source                 = var.local_file_path
}
