output "vm_name" {
  value = module.vm.vm_name
}

output "public_ip" {
  description = "Use this IP in your RDP client to connect"
  value       = module.vm.public_ip_address
}

output "private_ip" {
  value = module.vm.private_ip_address
}

output "resource_group" {
  value = module.vm.resource_group_name
}

output "rdp_command" {
  description = "Copy-paste this into Run (Win+R) or mstsc to RDP"
  value       = "mstsc /v:${module.vm.public_ip_address}"
}
