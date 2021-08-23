variable "location" {
  description = "Location of resource(s)"
  type        = string
}

variable "resource_group_name" {
  description = "Name of Azure Resource Group"
  type        = string
}

variable "storage_account_name" {
  description = "Name of Azure Storage Account"
  type        = string
}

variable "account_replication_type" {
  description = "Account Replication Type"
  type        = string
  default     = "LRS"
}

variable "storage_container_name" {
  description = "Name of Azure Storage Container"
  type        = string
}

variable "container_access_type" {
  description = "Azure Container Access Type (blob/container/private) - case sensitive"
  type        = string
}

variable "blob_filename" {
  description = "Name of Blob on Container"
  type        = string
}

variable "local_file_path" {
  description = "Path and name of source file to upload"
  type        = string
}

variable "blob_type" {
  description = "Type of Blob storage (Append/Block/Page)"
  type        = string
  default     = "Block"
}
