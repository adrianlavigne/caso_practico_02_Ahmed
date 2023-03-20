
output "vm_public_ip" {
  value = azurerm_public_ip.jn-pip.*.ip_address
}

output "azurerm_container_registry_login_server" {
  value = azurerm_container_registry.jn-acr.login_server
}

output "azurerm_container_registry_admin_username" {
  value = azurerm_container_registry.jn-acr.admin_username
}

output "azurerm_container_registry_admin_pd" {
  sensitive = false
  value     = nonsensitive(azurerm_container_registry.jn-acr.admin_password)
}
