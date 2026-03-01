resource "azurerm_postgresql_flexible_server" "main" {
  name                   = var.postgres_server_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  version                = var.postgres_version
  storage_mb             = var.storage_mb
  sku_name               = var.sku_name
  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  high_availability {
    mode                      = "ZoneRedundant"
    standby_availability_zone = "2"
  }

  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false
  public_network_access_enabled = false

  tags = var.common_tags
}

resource "azurerm_postgresql_flexible_server_database" "main" {
  server_id = azurerm_postgresql_flexible_server.main.id
  name      = var.db_name
  charset   = "UTF8"
  collation = "en_US.utf8"
}

resource "azurerm_private_endpoint" "this" {
  name                = "pe-postgres"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "psc-postgres"
    private_connection_resource_id = azurerm_postgresql_flexible_server.main.id
    subresource_names              = ["postgresqlServer"]
    is_manual_connection           = false
  }

  private_dns_zone_group {
    name                 = "default"
    private_dns_zone_ids = [var.private_dns_zone_id]
  }

  tags = var.common_tags
}
