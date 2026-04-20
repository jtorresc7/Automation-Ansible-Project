terraform {
  backend "azurerm" {
    resource_group_name  = "0216-backend-rg"
    storage_account_name = "st0216backend"
    container_name       = "tfstate"
    key                  = "assignment1-0216.tfstate"
    subscription_id      = "6fde9616-6d9c-4f48-868d-175acdd8b254"
    tenant_id            = "259aa634-900f-4aad-a76d-88098d413375"
  }
}
