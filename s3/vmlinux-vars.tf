 
variable "linux"{
	default = "n01619534-u-vm1"
}

variable "size"{
        default = "Standard_B1s"
}

variable "admin"{
        default = "firstn01619534"
}

variable "pubkey"{
        default = "~/.ssh/id_rsa.pub"
}

variable "os_disk"{
 type = map(string)
        default = {
 Storage_account_type = "Premium_LRS"
 Disk_size="32"
 Caching= "ReadWrite"
}
}
variable "ulinuxos"{
 type = map(string)
        default = {
 Publisher= "Canonical"
 Offer= "UbuntuServer"
 Sku= "19.04"
 Version= "latest"
}

}


