output "app_service_plan_id" {
  description = "APP service plan ID"
  value       = azurerm_service_plan.main.id
}

output "app_service_z1_id" {
  description = "App Service Zone 1 ID"
  value       = azurerm_linux_web_app.app_z1.id
}

output "app_service_z1_name" {
  description = "App Service Zone 1 name"
  value       = azurerm_linux_web_app.app_z1.name
}

output "app_service_z1_default_hostname" {
  description = "App Service Zone 1 default hostname"
  value       = azurerm_linux_web_app.app_z1.default_hostname
}

output "app_service_z2_id" {
  description = "App Service Zone 2 ID"
  value       = azurerm_linux_web_app.app_z2.id
}

output "app_service_z2_name" {
  description = "App Service Zone 2 name"
  value       = azurerm_linux_web_app.app_z2.name
}

output "app_service_z2_default_hostname" {
  description = "App Service Zone 2 default hostname"
  value       = azurerm_linux_web_app.app_z2.default_hostname
}

output "app_service_z1_principal_id" {
  description = "App Service Zone 1 principal ID"
  value       = azurerm_linux_web_app.app_z1.identity[0].principal_id
}

output "app_service_z2_principal_id" {
  description = "App Service Zone 2 principal ID"
  value       = azurerm_linux_web_app.app_z2.identity[0].principal_id
}
