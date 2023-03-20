resource "azurerm_kubernetes_cluster" "jn-aks" {
  name                = var.azurerm_kubernetes_cluster_name
  resource_group_name = azurerm_resource_group.jn-rg.name
  location            = azurerm_resource_group.jn-rg.location
  dns_prefix          = var.azurerm_kubernetes_cluster_name

  default_node_pool {
    name       = var.node_pool_name
    node_count = 1
    vm_size    = var.node_pool_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {}
}

resource "azurerm_role_assignment" "jn-role-assignment" {
  scope                            = azurerm_container_registry.jn-acr.id
  role_definition_name             = var.role_assignment_role_definition_name
  principal_id                     = azurerm_kubernetes_cluster.jn-aks.kubelet_identity.0.object_id
  skip_service_principal_aad_check = true
}