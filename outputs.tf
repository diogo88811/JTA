output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.main.name
}

output "vnet_id" {
  description = "Virtual Network ID"
  value       = module.networking.vnet_id
}

output "vnet_name" {
  description = "Virtual Network name"
  value       = module.networking.vnet_name
}

output "gateway_subnet_id" {
  description = "Gateway subnet ID"
  value       = module.networking.gateway_subnet_id
}

output "app_subnet_id" {
  description = "App subnet ID"
  value       = module.networking.app_subnet_id
}

output "db_subnet_id" {
  description = "DB subnet ID"
  value       = module.networking.db_subnet_id
}

output "vpn_gateway_id" {
  description = "VPN Gateway ID"
  value       = module.vpn.vpn_gateway_id
}

output "vpn_gateway_public_ip" {
  description = "VPN Gateway Public IP"
  value       = module.vpn.vpn_gateway_public_ip
}

output "app_service_plan_id" {
  description = "App Service Plan ID"
  value       = module.compute.app_service_plan_id
}

output "app_service_z1_name" {
  description = "App service zone 1 name"
  value       = module.compute.app_service_z1_name
}

output "app_service_z1_default_hostname" {
  description = "App service zone 1 hostname"
  value       = module.compute.app_service_z1_default_hostname
}

output "app_service_z2_name" {
  description = "App service zone 2 name"
  value       = module.compute.app_service_z2_name
}

output "app_service_z2_default_hostname" {
  description = "App service zone 2 hostname"
  value       = module.compute.app_service_z2_default_hostname
}

output "postgres_server_id" {
  description = "PostgreSQL server ID"
  value       = module.database.postgres_server_id
}

output "postgres_server_fqdn" {
  description = "PostgreSQL server FQDN"
  value       = module.database.postgres_server_fqdn
}

output "postgres_database_name" {
  description = "PostgreSQL database name"
  value       = module.database.database_name
}

output "storage_account_id" {
  description = "Storage account ID"
  value       = module.storage.storage_account_id
}

output "storage_account_name" {
  description = "Storage account name"
  value       = module.storage.storage_account_name
}

output "blob_container_name" {
  description = "Blob container name"
  value       = module.storage.blob_container_name
}

output "key_vault_id" {
  description = "Key Vault ID"
  value       = module.keyvault.key_vault_id
}

output "key_vault_name" {
  description = "Key Vault name"
  value       = module.keyvault.key_vault_name
}

output "key_vault_uri" {
  description = "Key Vault URI"
  value       = module.keyvault.key_vault_uri
}

output "postgres_pe_ip" {
  description = "PostgreSQL private endpoint IP"
  value       = module.database.private_endpoint_ip
}

output "blob_pe_ip" {
  description = "Blob private endpoint IP"
  value       = module.storage.private_endpoint_ip
}

output "keyvault_pe_ip" {
  description = "Key Vault private endpoint IP"
  value       = module.keyvault.private_endpoint_ip
}
