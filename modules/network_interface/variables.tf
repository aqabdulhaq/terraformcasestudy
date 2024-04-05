variable "network_interface_name" {
  description = "Name of the network interface"
  type        = string
}

variable "location" {
  description = "Location of the network interface"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_id" {
    type = string
}