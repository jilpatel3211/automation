variable "rg" {
	default ="network-rg"
}
variable "location" {
        default ="Canada Central"
}

variable "vnet" {
        default ="network-vnet"
}

variable "vnetspace" {
        default = ["10.0.0.0/16"]
}


variable "subnet1" {
        default ="network-subnet1"
}


variable "subnet1_space" {
        default = ["10.0.1.0/24"]
}

variable "subnet2" {
        default ="network-subnet2"
}
variable "subnet2_space" {
        default = ["10.0.1.0/24"]
}

variable "secg_1" {
        default = "network-nsg1"
}

variable "secg_2" {
        default = "network-nsg2"
}



