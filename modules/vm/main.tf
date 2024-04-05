resource "azurerm_linux_virtual_machine" "vm" {
  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
  name                  = var.vm_name
  resource_group_name   = var.resource_group_name
  location              = var.location
  size                  = var.vm_size

  admin_username        = var.admin_username
  admin_password        = var.admin_password


  network_interface_ids = var.nic
 
  os_disk {
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
   

  disable_password_authentication = false


}
