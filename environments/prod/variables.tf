variable "location" {
  type    = string
  default = "Central India"
}

variable "project" {
  type    = string
  default = "myproject"
}

variable "vm_size" {
  description = "VM size SKU"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  type    = string
  default = "adminuser"
}

variable "admin_password" {
  type      = string
  sensitive = true
}
