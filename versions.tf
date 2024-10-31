terraform {
  required_version = ">= 1.3"

  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.7.0"
    }

    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.36"
    }

    time = {
      source  = "hashicorp/time"
      version = "~> 0.9"
    }
  }
}
