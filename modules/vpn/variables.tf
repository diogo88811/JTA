variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "gateway_subnet_id" {
  type = string
}

variable "vpn_client_address_space" {
  type = string
}

variable "common_tags" {
  type = map(string)
}
