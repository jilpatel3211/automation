resource "azurerm_network_interface" "neti"{

name = "${var.linux}-nic"

location= azurerm_resource_group.network-rg.location
resource_group_name = azurerm_resource_group.network-rg.name

ip_configuration {

name= "${var.linux}-ipconf"
subnet_id = azurerm_subnet.network-subnet1.id
private_ip_address_allocation = "Dynamic"


} 
}
resource "azurerm_public_ip" "public_ip" {

name = "${var.linux}-pip"

resource_group_name = azurerm_resource_group.network-rg.name

location = azurerm_resource_group.network-rg.location

allocation_method = "Dynamic"

tags = {

environment = "Development"

}

}

resource "azurerm_dns_zone" "DNSlabel" {

name = "jil.com"

resource_group_name = azurerm_resource_group.network-rg.name
}

resource "azurerm_linux_virtual_machine" "Linux_VM"{

name = "${var.linux}-VM"

resource_group_name = azurerm_resource_group.network-rg.name

location =azurerm_resource_group.network-rg.location

size = var.size

admin_username = var.admin

network_interface_ids = [

azurerm_network_interface.neti.id,
]
admin_ssh_key {

username = var.admin

public_key = file(var.pubkey)
}
os_disk{

caching = var.os_disk["Caching"]

storage_account_type = var.os_disk["Storage_account_type"]
disk_size_gb = var.os_disk["Disk_size"]
}
source_image_reference {

publisher=var.ulinuxos["Publisher"] 
offer = var.ulinuxos["Offer"]

sku = var.ulinuxos["Sku"]

version = var.ulinuxos["Version"]
}
}