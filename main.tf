terraform {
  required_version = ">= 1.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.80"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_delete_on_destroy = false
    }
  }
}

data "azurerm_client_config" "current" {}

locals {
  common_tags = {
    Environment = var.environment
    Project     = "jta-web"
    ManagedBy   = "Terraform"
  }
}

resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location

  tags = local.common_tags
}

resource "random_password" "postgres_password" {
  length  = 32
  special = true
}

module "networking" {
  source = "./modules/networking"

  resource_group_name            = azurerm_resource_group.main.name
  location                       = azurerm_resource_group.main.location
  vnet_name                      = "vnet-${var.project_name}"
  vnet_address_space             = var.vnet_address_space
  gateway_subnet_prefix          = var.gateway_subnet_prefix
  app_subnet_prefix              = var.app_subnet_prefix
  db_subnet_prefix               = var.db_subnet_prefix
  blob_private_dns_zone_name     = var.blob_private_dns_zone_name
  postgres_private_dns_zone_name = var.postgres_private_dns_zone_name
  keyvault_private_dns_zone_name = var.keyvault_private_dns_zone_name
  common_tags                    = local.common_tags
}

module "database" {
  source = "./modules/database"

  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  postgres_server_name = "psql-${var.project_name}"
  db_name              = var.db_name
  admin_username       = var.db_admin_username
  admin_password       = random_password.postgres_password.result
  subnet_id            = module.networking.db_subnet_id
  private_dns_zone_id  = module.networking.postgres_private_dns_zone_id
  common_tags          = local.common_tags
}

module "storage" {
  source = "./modules/storage"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = module.networking.db_subnet_id
  private_dns_zone_id = module.networking.blob_private_dns_zone_id
  project_name        = var.project_name
  common_tags         = local.common_tags
}

module "keyvault" {
  source = "./modules/keyvault"

  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  subnet_id           = module.networking.db_subnet_id
  private_dns_zone_id = module.networking.keyvault_private_dns_zone_id
  tenant_id           = data.azurerm_client_config.current.tenant_id
  project_name        = var.project_name
  common_tags         = local.common_tags
}

module "vpn" {
  source = "./modules/vpn"

  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  gateway_subnet_id        = module.networking.gateway_subnet_id
  vpn_client_address_space = var.vpn_client_address_space
  common_tags              = local.common_tags
}

module "compute" {
  source = "./modules/compute"

  resource_group_name        = azurerm_resource_group.main.name
  location                   = azurerm_resource_group.main.location
  app_service_plan_name      = "asp-${var.project_name}"
  app_name                   = "app-${var.project_name}"
  sku_name                   = var.app_service_sku
  app_subnet_id              = module.networking.app_subnet_id
  postgres_connection_string = "Server=${module.database.postgres_server_fqdn};Port=5432;Database=${module.database.database_name};User Id=${var.db_admin_username};Password=${random_password.postgres_password.result};Ssl Mode=Require;"
  common_tags                = local.common_tags
}
