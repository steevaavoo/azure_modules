output "resource_group" {
  description = "Full details of Resource Group"
  value       = azurerm_resource_group.sc
}

output "storage_account" {
  description = "Full details of Storage Account"
  value       = azurerm_storage_account.sc
}

output "storage_container_name" {
  description = "Name of Storage Container"
  value       = azurerm_storage_container.sc.name
}

output "blob_filename" {
  description = "Name of uploaded Blob file"
  value       = azurerm_storage_blob.sc.name
}

output "blob_id" {
  description = "Blob download link"
  value       = azurerm_storage_blob.sc.id
}
