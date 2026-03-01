variable "resource_group_name" {
  description = "Name of the resource group"
  type = string
}

variable "location" {
  description = "Azure location"
  type = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type = string
}

variable "private_dns_zone_id" {
  description = "ID of the private DNS zone"
  type = string
}

variable "tenant_id" {
  description = "Azure tenant ID"
  type = string
}

variable "project_name" {
  description = "Project name for naming resources"
  type = string
}

variable "common_tags" {
  description = "Common tags for all resources"
  type = map(string)
}
