output "branch_policy_status_checks_id" {
  description = "Map of id values across all branch_policy_status_checks, keyed the same as var.branch_policy_status_checks"
  value       = { for k, v in azuredevops_branch_policy_status_check.branch_policy_status_checks : k => v.id }
}
output "branch_policy_status_checks_blocking" {
  description = "Map of blocking values across all branch_policy_status_checks, keyed the same as var.branch_policy_status_checks"
  value       = { for k, v in azuredevops_branch_policy_status_check.branch_policy_status_checks : k => v.blocking }
}
output "branch_policy_status_checks_enabled" {
  description = "Map of enabled values across all branch_policy_status_checks, keyed the same as var.branch_policy_status_checks"
  value       = { for k, v in azuredevops_branch_policy_status_check.branch_policy_status_checks : k => v.enabled }
}
output "branch_policy_status_checks_project_id" {
  description = "Map of project_id values across all branch_policy_status_checks, keyed the same as var.branch_policy_status_checks"
  value       = { for k, v in azuredevops_branch_policy_status_check.branch_policy_status_checks : k => v.project_id }
}
output "branch_policy_status_checks_settings" {
  description = "Map of settings values across all branch_policy_status_checks, keyed the same as var.branch_policy_status_checks"
  value       = { for k, v in azuredevops_branch_policy_status_check.branch_policy_status_checks : k => one(v.settings) }
}

