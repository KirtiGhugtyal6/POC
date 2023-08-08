terraform {
  backend "remote" {
    organization = "facing"
    workspaces {
      name = "vm-workspace"
    }
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.52.0"
    }
  }
}

provider "azurerm" {
  features {}
  #   tenant_id       = var.azure_tenant_id
  #   subscription_id = var.azure_subscription_id
  #   client_id       = var.azure_client_id
  #   client_secret   = var.azure_client_secret
}
