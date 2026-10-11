variable "branch_policy_status_checks" {
  description = <<EOT
Map of branch_policy_status_checks, attributes below
Required:
    - project_id
    - settings (block):
        - applicability (optional)
        - author_id (optional)
        - display_name (optional)
        - filename_patterns (optional)
        - genre (optional)
        - invalidate_on_update (optional)
        - name (required)
        - scope (required, block):
            - match_type (optional)
            - repository_id (optional)
            - repository_ref (optional)
Optional:
    - blocking
    - enabled
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    project_id = string
    blocking   = optional(bool)
    enabled    = optional(bool)
    settings = object({
      applicability        = optional(string)
      author_id            = optional(string)
      display_name         = optional(string)
      filename_patterns    = optional(list(string))
      genre                = optional(string)
      invalidate_on_update = optional(bool)
      name                 = string
      scope = list(object({
        match_type     = optional(string)
        repository_id  = optional(string)
        repository_ref = optional(string)
      }))
    })
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.branch_policy_status_checks : (
        length(v.settings.scope) >= 1
      )
    ])
    error_message = "Each scope list must contain at least 1 items"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

