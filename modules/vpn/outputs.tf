output "vpn_gateway_id" {
  value = azurerm_virtual_network_gateway.this.id
}

output "vpn_gateway_public_ip" {
  value = azurerm_public_ip.this.ip_address
}
