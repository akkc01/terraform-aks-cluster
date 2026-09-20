terraform {
  backend "azurerm" {
    resource_group_name  = "akkc"
    storage_account_name = "axionteststgakk01"
    container_name       = "axion-statefile"
    key                  = "aks.dev.tfstate"
  }
}
