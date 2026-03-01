resource "azurerm_public_ip" "this" {
  name                = "pip-vpn"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.common_tags
}

resource "azurerm_virtual_network_gateway" "this" {
  name                = "vng-main"
  location            = var.location
  resource_group_name = var.resource_group_name
  type                = "Vpn"
  vpn_type            = "RouteBased"
  active_active       = false
  enable_bgp          = false
  sku                 = "VpnGw1"

  ip_configuration {
    name                 = "vpngw-ipconfig"
    public_ip_address_id = azurerm_public_ip.this.id
    subnet_id            = var.gateway_subnet_id
  }

  tags = var.common_tags
}
