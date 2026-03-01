output "app_service_plan_id" {
  value = azurerm_service_plan.main.id
}

output "app_service_z1_id" {
  value = azurerm_linux_web_app.app_z1.id
}

output "app_service_z1_name" {
  value = azurerm_linux_web_app.app_z1.name
}

output "app_service_z1_default_hostname" {
  value = azurerm_linux_web_app.app_z1.default_hostname
}

output "app_service_z2_id" {
  value = azurerm_linux_web_app.app_z2.id
}

output "app_service_z2_name" {
  value = azurerm_linux_web_app.app_z2.name
}

output "app_service_z2_default_hostname" {
  value = azurerm_linux_web_app.app_z2.default_hostname
}

output "app_service_z1_principal_id" {
  value = azurerm_linux_web_app.app_z1.identity[0].principal_id
}

output "app_service_z2_principal_id" {
  value = azurerm_linux_web_app.app_z2.identity[0].principal_id
}
