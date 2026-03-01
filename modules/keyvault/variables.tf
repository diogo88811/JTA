variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "private_dns_zone_id" {
  type = string
}

variable "tenant_id" {
  type = string
}

variable "project_name" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
