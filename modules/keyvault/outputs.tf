output "key_vault_id" {
  description = "KeyVault id"
  value = azurerm_key_vault.this.id
}

output "key_vault_name" {
  description = "KeyVault name"
  value = azurerm_key_vault.this.name
}

output "key_vault_uri" {
  description = "KeyVault URI"
  value = azurerm_key_vault.this.vault_uri
}

output "private_endpoint_ip" {
  description = "Private endpoint IP address"
  value = azurerm_private_endpoint.this.private_service_connection[0].private_ip_address
}
