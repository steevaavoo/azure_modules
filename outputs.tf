output "blob_filename" {
  description = "Name of Blob file uploaded by Storage Account Module"
  value       = module.azure_storage_account.blob_filename
}
