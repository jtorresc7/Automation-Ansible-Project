#terraform {
#  required_version = ">= 1.3.0"

#  required_providers {
#    azurerm = {
#      source  = "hashicorp/azurerm"
#      version = "~> 4.0"
#    }

#    null = {
#      source  = "hashicorp/null"
#      version = "~> 3.0"
#    }
#  }
#}

#provider "azurerm" {
#  features {
#    resource_group {
#      prevent_deletion_if_contains_resources = false
#    }
#  }
#}

#provider "azurerm" {
#  subscription_id = "6fde9616-6d9c-4f48-868d-175acdd8b254"
#  tenant_id       = "259aa634-900f-4aad-a76d-88098d413375"

#  features {
#    resource_group {
#      prevent_deletion_if_contains_resources = false
#    }
#  }
#}

terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.64.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.4"
    }
  }
}

provider "azurerm" {
  subscription_id = "6fde9616-6d9c-4f48-868d-175acdd8b254"
  tenant_id       = "259aa634-900f-4aad-a76d-88098d413375"

  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
}
