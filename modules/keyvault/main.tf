resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}

resource "azurerm_key_vault" "this" {
  name                          = substr("kv-${var.project_name}-${random_string.suffix.result}", 0, 24)
  location                      = var.location
  resource_group_name           = var.resource_group_name
  tenant_id                     = var.tenant_id
  sku_name                      = "standard"
  enable_rbac_authorization     = true
  public_network_access_enabled = false

  tags = var.common_tags
}

resource "azurerm_private_endpoint" "this" {
  name                = "pe-keyvault"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-keyvault"
    private_connection_resource_id = azurerm_key_vault.this.id
    subresource_names              = ["vault"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  tags = var.common_tags
}
