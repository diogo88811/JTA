variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "app_service_plan_name" {
  description = "App Service Plan name"
  type        = string
}

variable "app_name" {
  description = "App Service name prefix"
  type        = string
}

variable "sku_name" {
  description = "App Service Plan SKU"
  type        = string
}

variable "app_subnet_id" {
  description = "App subnet ID for VNet integration"
  type        = string
}

variable "postgres_connection_string" {
  description = "PostgreSQL connection string"
  type        = string
  sensitive   = true
}

variable "common_tags" {
  description = "Common tags"
  type        = map(string)
}
