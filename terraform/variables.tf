#resources_general
variable "resource_group_name" {
  default = "jn-casopractico02"
}

variable "location_name" {
  default = "France Central"
}

variable "network_name" {
  default = "vnet1"
}

variable "subnet_name" {
  default = "subnet1"
}

variable "securitygroup_name" {
  default = "securitygroup1"
}

variable "virtual_network_address_space" {
  default = "192.168.100.0/24"
}

variable "subnet_address_prefixes" {
  default = "192.168.100.0/28"
}

#resources_acr
variable "azurerm_container_registry_name" {
  default = "jnazurecontainerregistry1"
}

variable "container_registry_sku" {
  default = "Standard"
}

#resources_vm
variable "azurerm_linux_virtual_machine_name" {
  default = "vm1"
}

variable "virtual_machine_name_size" {
  default = "Standard_F2"
}

variable "virtual_machine_admin_username" {
  default = "azureadmin"
}

variable "public_ssh_key_file" {
  default = "~/.ssh/id_rsa.pub"
}

variable "os_disk_storage_account_type" {
  default = "Standard_LRS"
}

variable "azurerm_network_interface_name" {
  default = "vnic1"
}

variable "public_ip_allocation_method" {
  default = "Static"
}

variable "public_ip_sku" {
  default = "Standard"
}

variable "azurerm_public_ip_name" {
  default = "pip1"
}

#resources_aks
variable "azurerm_kubernetes_cluster_name" {
  default = "aks1"
}

variable "node_pool_name" {
  default = "nodepool1"
}

variable "node_pool_vm_size" {
  default = "Standard_D2_v2"
}

variable "role_assignment_role_definition_name" {
  default = "AcrPull"
}
