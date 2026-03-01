output "postgres_server_id" {
  description = "PostgreSQL server ID"
  value       = azurerm_postgresql_flexible_server.main.id
}

output "postgres_server_fqdn" {
  description = "PostgreSQL server FQDN"
  value       = azurerm_postgresql_flexible_server.main.fqdn
}

output "database_name" {
  description = "Database name"
  value       = azurerm_postgresql_flexible_server_database.main.name
}

output "private_endpoint_ip" {
  description = "PostgreSQL private endpoint IP"
  value       = azurerm_private_endpoint.this.private_service_connection[0].private_ip_address
}
