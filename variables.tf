variable "project_name" {
  description = "Project name (used for resource naming)"
  type        = string
  default     = "jtaweb"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "prod"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "rg-jtaweb-prod"
}

variable "vnet_address_space" {
  description = "Virtual Network address space"
  type        = string
  default     = "10.0.0.0/16"
}

variable "gateway_subnet_prefix" {
  description = "Gateway Subnet address prefix"
  type        = string
  default     = "10.0.0.0/25"
}

variable "app_subnet_prefix" {
  description = "App Service Subnet address prefix"
  type        = string
  default     = "10.0.10.0/24"
}

variable "db_subnet_prefix" {
  description = "Database Subnet address prefix"
  type        = string
  default     = "10.0.20.0/24"
}

variable "vpn_client_address_space" {
  description = "VPN Client address space"
  type        = string
  default     = "172.16.0.0/24"
}

variable "app_service_sku" {
  description = "App Service Plan SKU"
  type        = string
  default     = "P1v3"
}

variable "db_name" {
  description = "PostgreSQL database name"
  type        = string
  default     = "jtawebdb"
}

variable "db_admin_username" {
  description = "PostgreSQL admin username"
  type        = string
  default     = "jtaadmin"
}

variable "blob_private_dns_zone_name" {
  description = "Private DNS zone for blob endpoints"
  type        = string
  default     = "privatelink.blob.core.windows.net"
}

variable "postgres_private_dns_zone_name" {
  description = "Private DNS zone for PostgreSQL endpoints"
  type        = string
  default     = "privatelink.postgres.database.azure.com"
}

variable "keyvault_private_dns_zone_name" {
  description = "Private DNS zone for Key Vault endpoints"
  type        = string
  default     = "privatelink.vaultcore.azure.net"
}
