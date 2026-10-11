output "branch_policy_status_checks_id" {
  description = "Map of id values across all branch_policy_status_checks, keyed the same as var.branch_policy_status_checks except keys with no id are omitted"
  value       = { for k, v in azuredevops_branch_policy_status_check.branch_policy_status_checks : k => v.id if v.id != null && length(v.id) > 0 }
}
output "branch_policy_status_checks_blocking" {
  description = "Map of blocking values across all branch_policy_status_checks, keyed the same as var.branch_policy_status_checks except keys with no blocking are omitted"
  value       = { for k, v in azuredevops_branch_policy_status_check.branch_policy_status_checks : k => v.blocking if v.blocking != null }
}
output "branch_policy_status_checks_enabled" {
  description = "Map of enabled values across all branch_policy_status_checks, keyed the same as var.branch_policy_status_checks except keys with no enabled are omitted"
  value       = { for k, v in azuredevops_branch_policy_status_check.branch_policy_status_checks : k => v.enabled if v.enabled != null }
}
output "branch_policy_status_checks_project_id" {
  description = "Map of project_id values across all branch_policy_status_checks, keyed the same as var.branch_policy_status_checks except keys with no project_id are omitted"
  value       = { for k, v in azuredevops_branch_policy_status_check.branch_policy_status_checks : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "branch_policy_status_checks_settings" {
  description = "Map of settings values across all branch_policy_status_checks, keyed the same as var.branch_policy_status_checks except keys with no settings are omitted"
  value       = { for k, v in azuredevops_branch_policy_status_check.branch_policy_status_checks : k => one(v.settings) if v.settings != null && length(v.settings) > 0 }
}

