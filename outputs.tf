########################################################################################################################
# Outputs
########################################################################################################################


output "keyprotect_default_rootkey_id" {
  value       = try(module.kp_crk[0].id, "")
  description = "The ID of the created customer root key in IBM Key Protect"
}
output "keyprotect_default_rootkey_guid" {
  value       = try(module.kp_crk[0].key_id, "")
  description = "The GUID of the created customer root key in IBM Key Protect"
}

output "keyprotect_default_rootkey_crn" {
  value       = try(module.kp_crk[0].crn, "")
  description = "The CRN of the created customer root key in IBM Key Protect"
}

output "keyprotect_instance_id" {
  description = "The instance Id of the Key Protect instance."
  value       = try(module.kp[0].instance_id, "")
}
