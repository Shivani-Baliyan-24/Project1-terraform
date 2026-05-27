# Using local backend by default so it works immediately without any setup.
# To switch to Azure Blob Storage (recommended for teams), comment out the
# "local" block below and uncomment the "azurerm" block, then fill in your values.

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }

  # --- OPTIONAL: Azure remote backend ---
  # backend "azurerm" {
  #   resource_group_name  = "rg-terraform-state"
  #   storage_account_name = "yourstorageaccount"
  #   container_name       = "tfstate"
  #   key                  = "dev.terraform.tfstate"
  # }
}
