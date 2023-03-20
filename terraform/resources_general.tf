resource "azurerm_resource_group" "jn-rg" {
  name     = var.resource_group_name
  location = var.location_name
}

resource "azurerm_virtual_network" "jn-vnet" {
  name                = var.network_name
  address_space       = [var.virtual_network_address_space]
  location            = azurerm_resource_group.jn-rg.location
  resource_group_name = azurerm_resource_group.jn-rg.name
}

resource "azurerm_subnet" "jn-subnet" {
  name                 = var.subnet_name
  resource_group_name  = azurerm_resource_group.jn-rg.name
  virtual_network_name = azurerm_virtual_network.jn-vnet.name
  address_prefixes     = [var.subnet_address_prefixes]
}

resource "azurerm_network_security_group" "jn-nsg" {
  name                = var.securitygroup_name
  location            = azurerm_resource_group.jn-rg.location
  resource_group_name = azurerm_resource_group.jn-rg.name

  security_rule {
    #Allow ssh traffic from Internet to my private subnet 
    name                       = "SSH"
    priority                   = 1100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    #Allow traffic from Internet to port 8080 in my private subnet 
    name                       = "allow-http-all8080"
    priority                   = 1200
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

}
resource "azurerm_subnet_network_security_group_association" "jn-nsg-link" {
  subnet_id                 = azurerm_subnet.jn-subnet.id
  network_security_group_id = azurerm_network_security_group.jn-nsg.id
}