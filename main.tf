resource "azurerm_resource_group" "vm_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.vm_rg.name
  location            = azurerm_resource_group.vm_rg.location
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  address_prefixes     = ["10.0.2.0/24"]
  resource_group_name  = azurerm_virtual_network.vnet.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_network_interface" "vm_nic" {
  name                = var.nic_name
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name

  ip_configuration {
    name                          = var.nic_ip_config_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.nic_ip_config_private_ip_addr_allocation
  }
}

resource "azurerm_linux_virtual_machine" "ado_agent" {
  name                            = var.vm_name
  location                        = azurerm_resource_group.vm_rg.location
  resource_group_name             = azurerm_resource_group.vm_rg.name
  size                            = var.vm_size
  admin_username                  = var.vm_user
  disable_password_authentication = true
  network_interface_ids           = azurerm_network_interface.vm_nic.id

  admin_ssh_key {
    username   = var.vm_user
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/AfIRzSJ2+o/9DdHN0c6Q3P2VCT/Jpao0Hdj62l95ZWjf0tT+DOdov0lXriL3BOAJ9zhSOT1IrZ5Y0GewN1MkHbQcPgY0ykJz0npHeSp8FMlGhOEmFNRzSweHsOJ7DoAQ9oRxLl08Z1PuPr9deNsf6r8OqP4Tz90UFfUuUiqtgeEphujMC8vg9tpHdgiXwtdY1wYMKNT9bjRU564eAwGBheSiyygsMallZbH5niC8i7VN/F23fjUxxx4En5qGy3PI3Ui12tJ1D/OhhAvLrsFLG90ItE2MAzas7Yb4NUDs1hMJu31lZvISYq1HdEwvtNq6xEFc4lHf3ClswNTAvfqb ado-agent"
  }

  os_disk {
    name                 = var.vm_os_disk_name
    caching              = var.vm_os_disk_caching
    storage_account_type = var.vm_os_disk_storage_acc_type
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "20_04_lts"
    version   = "latest"
  }

  identity {
    type = var.vm_identity_type
  }
}
