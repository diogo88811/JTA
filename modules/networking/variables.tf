variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "vnet_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "vnet_address_space" {
  description = "Address space of the virtual network"
  type        = string
}

variable "gateway_subnet_prefix" {
  description = "Gateway subnet CIDR"
  type        = string
}

variable "app_subnet_prefix" {
  description = "App subnet CIDR"
  type        = string
}

variable "db_subnet_prefix" {
  description = "Database subnet CIDR"
  type        = string
}

variable "blob_private_dns_zone_name" {
  description = "Private DNS zone name for blob storage private endpoints"
  type        = string
}

variable "postgres_private_dns_zone_name" {
  description = "Private DNS zone name for PostgreSQL private endpoints"
  type        = string
}

variable "keyvault_private_dns_zone_name" {
  description = "Private DNS zone name for Key Vault private endpoints"
  type        = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type        = map(string)
}
