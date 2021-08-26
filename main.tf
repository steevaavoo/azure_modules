terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.73.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# module "azure_storage_account" {
#   source                 = "./modules/azure-storage-account"
#   location               = "East US"
#   resource_group_name    = "steevaavoo-rg"
#   storage_account_name   = "steevaavoosa"
#   storage_container_name = "steevaavoosc"
#   container_access_type  = "blob"
#   blob_filename          = "My-Epic-Upload.zip"
#   local_file_path        = "./blobs/my-upload.zip"
# }

module "azure_vnet" {
  source              = "./modules/azure-vnet"
  location            = "East US"
  resource_group_name = "steevaavoo-rg"
  vnet_name           = "steevaavoo-vnet"
  # subnet variable defaults to 3 - override here if desired
  # subnet = {
  #   "subnet1" = "10.0.1.0/24"
  # }
}
