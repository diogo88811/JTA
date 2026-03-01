output "vnet_id" {
  description = "Virtual network ID"
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Virtual network name"
  value       = azurerm_virtual_network.main.name
}

output "gateway_subnet_id" {
  description = "Gateway subnet ID"
  value       = azurerm_subnet.gateway.id
}

output "app_subnet_id" {
  description = "App subnet ID"
  value       = azurerm_subnet.app.id
}

output "db_subnet_id" {
  description = "DB subnet ID"
  value       = azurerm_subnet.db.id
}

output "blob_private_dns_zone_id" {
  description = "Blob private DNS zone ID"
  value       = azurerm_private_dns_zone.blob.id
}

output "postgres_private_dns_zone_id" {
  description = "PostgreSQL private DNS zone ID"
  value       = azurerm_private_dns_zone.postgres.id
}

output "keyvault_private_dns_zone_id" {
  description = "Key Vault private DNS zone ID"
  value       = azurerm_private_dns_zone.keyvault.id
}
