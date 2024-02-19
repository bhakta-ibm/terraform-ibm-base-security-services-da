########################################################################################################################
# Outputs
########################################################################################################################

output "kp_instance_id" {
  description = "KP instance id"
  value       = module.base_security_default_instances.instance_id
}

output "resource_group_name" {
  description = "Resource group name"
  value       = module.resource_group.resource_group_name
}

output "resource_group_id" {
  description = "Resource group ID"
  value       = module.resource_group.resource_group_id
}
