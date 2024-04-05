terraform {
  backend "azurerm" {
    storage_account_name = "<your_storage_name>"
    container_name       = "<your_container_name>"
    key                  = "<key>"
    access_key = "<your_access_key>"
  }
}
