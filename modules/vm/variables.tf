variable "prefix" {
  description = "Prefix used for naming all resources (e.g. 'dev', 'prod')"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Azure Resource Group to create"
  type        = string
}

variable "location" {
  description = "Azure region For Central India use v3 VM sizes only"
  default = "Central India"
}

variable "vm_size" {
  description = "Windows VM size — verified available in Central India"
  type    = string
  default = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Windows administrator username (cannot be 'Administrator', 'admin', 'user', 'root')"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "Windows administrator password (min 12 chars, upper+lower+number+symbol)"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}
