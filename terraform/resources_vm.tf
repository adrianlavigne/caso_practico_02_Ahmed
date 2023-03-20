resource "azurerm_linux_virtual_machine" "jn-vm" {
  name                = var.azurerm_linux_virtual_machine_name
  resource_group_name = azurerm_resource_group.jn-rg.name
  location            = azurerm_resource_group.jn-rg.location
  size                = var.virtual_machine_name_size
  admin_username      = var.virtual_machine_admin_username
  network_interface_ids = [
    azurerm_network_interface.jn-nic.id,
  ]

  admin_ssh_key {
    username   = var.virtual_machine_admin_username
    public_key = file(var.public_ssh_key_file)
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = var.os_disk_storage_account_type
  }

  source_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_5"
    version   = "latest"
  }
}

resource "azurerm_network_interface" "jn-nic" {
  name                = var.azurerm_network_interface_name
  location            = azurerm_resource_group.jn-rg.location
  resource_group_name = azurerm_resource_group.jn-rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.jn-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jn-pip.id
  }
}

resource "azurerm_public_ip" "jn-pip" {
  name                = var.azurerm_public_ip_name
  location            = azurerm_resource_group.jn-rg.location
  resource_group_name = azurerm_resource_group.jn-rg.name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
}