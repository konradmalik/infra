output "private_ip" {
  description = "The private IP address assigned to the instance."
  value       = module.vm.private_ip
}

output "public_ip" {
  description = "The public IP address assigned to the instance."
  value       = module.vm.public_ip
}

output "instance_ocid" {
  description = "The OCID of the instance that was created"
  value       = module.vm.instance_ocid
}
