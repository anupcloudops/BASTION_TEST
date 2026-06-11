terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.71.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "448f5bc1-2cca-479b-80a7-aab8ffdc01b9"
}