output "storage_account_id" {
  description = "Storage account ID"
  value = azurerm_storage_account.this.id
}

output "storage_account_name" {
  description = "Storage account name"
  value = azurerm_storage_account.this.name
}

output "blob_container_name" {
  description = "Blob container name"
  value = azurerm_storage_container.uploads.name
}

output "private_endpoint_ip" {
  description = "Private endpoint IP address"
  value = azurerm_private_endpoint.this.private_service_connection[0].private_ip_address
}
