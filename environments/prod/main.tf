# =============================================================
# environments/prod/main.tf
# Same module, different values — bigger VM, no public IP ideally
# =============================================================

module "vm" {
  source = "../../modules/vm"

  prefix              = "prod"
  resource_group_name = "rg-prod11-${var.project}"
  location            = var.location
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password

  tags = {
    environment = "prod"
    project     = var.project
    managed_by  = "terraform"
  }
}
