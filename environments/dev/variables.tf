variable "location" {
  description = "Azure region"
  type        = string
  default     = "Central India"
}

variable "project" {
  description = "Project name"
  type        = string
  default     = "myproject"
}

variable "vm_size" {
  description = "VM size SKU"
  type        = string
  default     = "Standard_D4s_v3"
}

variable "admin_username" {
  description = "Windows admin username"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "Windows admin password"
  type        = string
  sensitive   = true
}
