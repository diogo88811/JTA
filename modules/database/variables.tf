variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "postgres_server_name" {
  description = "PostgreSQL server name"
  type        = string
}

variable "postgres_version" {
  description = "PostgreSQL version"
  type        = string
  default     = "14"
}

variable "sku_name" {
  description = "PostgreSQL SKU"
  type        = string
  default     = "B_Standard_B2s"
}

variable "storage_mb" {
  description = "Storage in MB"
  type        = number
  default     = 32768
}

variable "db_name" {
  description = "Database name"
  type        = string
}

variable "admin_username" {
  description = "PostgreSQL admin username"
  type        = string
}

variable "admin_password" {
  description = "PostgreSQL admin password"
  type        = string
  sensitive   = true
}

variable "subnet_id" {
  description = "Subnet ID for private endpoint"
  type        = string
}

variable "private_dns_zone_id" {
  description = "Private DNS zone ID for PostgreSQL"
  type        = string
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}
