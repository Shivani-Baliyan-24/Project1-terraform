# =============================================================
# environments/dev/main.tf
# This is the entry point for the DEV environment.
# It calls the shared vm module with dev-specific values.
# =============================================================

module "vm" {
  source = "../../modules/vm"

  prefix              = "dev"
  resource_group_name = "rg-dev-${var.project}"
  location            = var.location
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  tags = {
    environment = "dev"
    project     = var.project
    managed_by  = "terraform"
  }
}
