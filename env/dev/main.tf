terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.72.0"
    }
  }

  # Update this block with the location of your terraform state file
  # Azure SUB 39b9b166-ea25-4948-b619-606b4a314473 - VS - MPN 2024 - Terraform
  backend "azurerm" {
    resource_group_name  = "rg-terraform-github-actions-state"
    storage_account_name = "pcgmkntfgithubactions"
    container_name       = "prod-tfstate"
    key                  = "terraform.tfstate"
    use_oidc             = true
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

# Define any Azure resources to be created here. A simple resource group is shown here as a minimal example.
resource "azurerm_resource_group" "rg-test" {
  name     = var.resource_group_name
  location = var.location
}