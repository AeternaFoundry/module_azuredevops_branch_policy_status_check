resource "azuredevops_branch_policy_status_check" "branch_policy_status_checks" {
  for_each = var.branch_policy_status_checks

  project_id = each.value.project_id
  blocking   = each.value.blocking
  enabled    = each.value.enabled

  settings {
    applicability        = each.value.settings.applicability
    author_id            = each.value.settings.author_id
    display_name         = each.value.settings.display_name
    filename_patterns    = each.value.settings.filename_patterns
    genre                = each.value.settings.genre
    invalidate_on_update = each.value.settings.invalidate_on_update
    name                 = each.value.settings.name
    dynamic "scope" {
      for_each = each.value.settings.scope
      content {
        match_type     = scope.value.match_type
        repository_id  = scope.value.repository_id
        repository_ref = scope.value.repository_ref
      }
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

