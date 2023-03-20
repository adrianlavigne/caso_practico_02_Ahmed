resource "azurerm_container_registry" "jn-acr" {
  name                = var.azurerm_container_registry_name
  resource_group_name = azurerm_resource_group.jn-rg.name
  location            = azurerm_resource_group.jn-rg.location
  sku                 = var.container_registry_sku
  admin_enabled       = true

}