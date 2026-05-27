output "vm_name" {
  description = "Name of the Windows VM"
  value       = azurerm_windows_virtual_machine.vm.name
}

output "vm_id" {
  description = "Resource ID of the Windows VM"
  value       = azurerm_windows_virtual_machine.vm.id
}

output "public_ip_address" {
  description = "Public IP — use this to RDP into the VM"
  value       = azurerm_public_ip.pip.ip_address
}

output "private_ip_address" {
  description = "Private IP address of the VM inside the VNet"
  value       = azurerm_network_interface.nic.private_ip_address
}

output "resource_group_name" {
  description = "Resource group that contains all resources"
  value       = azurerm_resource_group.rg.name
}

output "vnet_id" {
  description = "Virtual Network resource ID"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_id" {
  description = "Subnet resource ID"
  value       = azurerm_subnet.subnet.id
}
