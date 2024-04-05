
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}


module "vnet" {
  source              = "./modules/virtual_network"
  resource_group_name = var.resource_group_name
  location            = var.location
  vnet_name           = var.vnet_name
  address_space       = var.vnet_address_space
}


module "subnet" {
  source              = "./modules/subnet"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_name         = var.subnet_name
  vnet_id             = module.vnet.vnet_id  
  vnet_name           = module.vnet.vnet_name
}


module "vm" {
  source              = "./modules/vm"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.subnet.subnet_id
  vm_name             = var.vm_name
  vm_size             = var.vm_size
  image_publisher     = var.image_publisher
  image_offer         = var.image_offer
  image_sku           = var.image_sku
  image_version       = var.image_version
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  nic                 = [module.nic.network_interface_id]
}

module "nic" {
  source            = "./modules/network_interface"
  resource_group_name = var.resource_group_name
  location            = var.location
  subnet_id           = module.subnet.subnet_id
  network_interface_name = "my_network" 
}
