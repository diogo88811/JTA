resource "azurerm_service_plan" "main" {
  name                   = var.app_service_plan_name
  location               = var.location
  resource_group_name    = var.resource_group_name
  os_type                = "Linux"
  sku_name               = var.sku_name
  zone_balancing_enabled = true

  tags = var.common_tags
}

resource "azurerm_linux_web_app" "app_z1" {
  name                = "${var.app_name}-z1"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.main.id

  virtual_network_subnet_id = var.app_subnet_id

  site_config {
    always_on                = true
    minimum_tls_version      = "1.2"
    http2_enabled            = true
    websockets_enabled       = false
    remote_debugging_enabled = false

    application_stack {
      node_version = "20-lts"
    }

    health_check_path = "/health"
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "Custom"
    value = var.postgres_connection_string
  }

  tags = merge(var.common_tags, {
    Zone = "1"
  })
}

resource "azurerm_linux_web_app" "app_z2" {
  name                = "${var.app_name}-z2"
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.main.id

  virtual_network_subnet_id = var.app_subnet_id

  site_config {
    always_on                = true
    minimum_tls_version      = "1.2"
    http2_enabled            = true
    websockets_enabled       = false
    remote_debugging_enabled = false

    application_stack {
      node_version = "20-lts"
    }

    health_check_path = "/health"
  }

  identity {
    type = "SystemAssigned"
  }

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
  }

  connection_string {
    name  = "DefaultConnection"
    type  = "Custom"
    value = var.postgres_connection_string
  }

  tags = merge(var.common_tags, {
    Zone = "2"
  })
}
