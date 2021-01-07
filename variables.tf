variable "name" {
  description = "Name of the repository"
  type        = string
}

variable "description" {
  description = "Description of the repository"
  type        = string
  default     = null
}

variable "allow_merge_commit" {
  description = "Whether to allow merge commits"
  type        = bool
  default     = false
}

variable "allow_squash_merge" {
  description = "Whether to allow squash merging"
  type        = bool
  default     = false
}

variable "allow_rebase_merge" {
  description = "Whether to allow rebase merging"
  type        = bool
  default     = true
}

variable "archive_on_destroy" {
  description = "Whether to archive on destroy instead of delete"
  type        = bool
  default     = false
}

variable "auto_init" {
  description = "Automatically initialize the repository upon creation"
  type        = bool
  default     = true
}

variable "delete_branch_on_merge" {
  description = "Automatically delete head branch after a pull request is merged"
  type        = bool
  default     = true
}

variable "gitignore_template" {
  description = "Gitignore template to include in the repository"
  type        = string
  default     = null
}

variable "has_issues" {
  description = "Enable the GitHub Issues features on the repository"
  type        = bool
  default     = true
}

variable "has_projects" {
  description = "Enable the GitHub Projects features on the repository"
  type        = bool
  default     = false
}

variable "has_wiki" {
  description = "Enable the GitHub Wiki features on the repository"
  type        = bool
  default     = false
}

variable "homepage_url" {
  description = "URL of a page describing the project"
  type        = string
  default     = null
}

variable "is_template" {
  description = "Configure this repository as a template repository"
  type        = bool
  default     = false
}

variable "license_template" {
  description = "Type of license to include in the repository"
  type        = string
  default     = null
}

variable "topics" {
  description = "List of topics to apply to the repository"
  type        = list(string)
  default     = []
}

variable "visibility" {
  description = "Visibility of the repository. One of: `public`, `private`, or `internal`"
  type        = string
  default     = "public"
}

variable "vulnerability_alerts" {
  description = "Whether to enable security alerts for dependencies"
  type        = bool
  default     = true
}

variable "template" {
  description = "Template repository used to create this repository"
  type = object({
    owner      = string
    repository = string
  })
  default = null
}

variable "branch_protection" {
  description = "Branch protection configuration"
  type = object({
    enforce_admins         = optional(bool)
    push_restrictions      = optional(list(string))
    require_signed_commits = optional(bool)
    required_status_checks = optional(object({
      strict   = optional(bool)
      contexts = list(string)
    }))
    required_pull_request_reviews = optional(object({
      dismiss_stale_reviews           = optional(bool)
      dismissal_restrictions          = optional(list(string))
      require_code_owner_reviews      = optional(bool)
      required_approving_review_count = number
    }))
  })
  default = null
}

variable "teams" {
  description = "List of teams to grant permissions to the repository"
  type = list(object({
    name       = string
    permission = optional(string)
  }))
  default = []
}
