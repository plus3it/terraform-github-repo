variable "name" {
  description = "The name of the repostory to create"
  type        = string
  default     = null
}

variable "homepage_url" {
  description = "URL of a page describing the project."
  type        = string
  default     = null
}

variable "description" {
  description = "Description for the repository being created"
  type        = string
  default     = "A Terraform Module"
}

variable "protected_branch" {
  description = "The branch to protect"
  type        = string
  default     = "master"
}

variable "enable_strict_checks" {
  description = "Require branches to be up to date before merging."
  type        = bool
  default     = false
}

variable "enforce_admins" {
  description = "Enforces status checks on repository administrators"
  type        = bool
  default     = false
}

variable "enforce_code_owner_review" {
  description = "Require an approved review in pull requests including files with a designated code owner"
  type        = bool
  default     = false
}

variable "required_status_checks" {
  description = "The list of status checks to require in order to merge into this branch."
  type        = list(string)
  default     = []
}

variable "enable_issues" {
  description = "Enable the GitHub Issues features on the repository"
  type        = bool
  default     = false
}

variable "enable_projects" {
  description = "Enable the GitHub Projects features on the repository"
  type        = bool
  default     = false
}

variable "enable_merge_commits" {
  description = "Whether or not to allow merge commits"
  type        = bool
  default     = false
}

variable "enable_squash_merging" {
  description = "Whether or not to allow squash merging"
  type        = bool
  default     = false
}

variable "enable_rebase_merging" {
  description = "Whether or not to allow rebase merging"
  type        = bool
  default     = false
}

variable "enable_auto_init" {
  description = "Automatically initialize the repository upon creation"
  type        = bool
  default     = false
}

variable "license_template" {
  description = "Type of license to include in the repository"
  type        = string
  default     = "apache-2.0"
}

variable "topics" {
  description = "List of topics to apply to the repository"
  type        = list(string)
  default     = []
}

variable "gitignore_template" {
  description = "Gitignore template to include in the repository"
  type        = string
  default     = null
}

variable "access_teams" {
  description = "List of maps with the `name` of the team that can access the repository and its `permission` (e.g., [{name = test, permission = pull}])"
  type        = list(any)
  default     = []
}

variable "restricted_pr_teams" {
  description = "List of organizational teams who can dismiss a pull request"
  type        = list(string)
  default     = []
}

variable "restricted_push_teams" {
  description = "List of organizational teams who can push to the branch"
  type        = list(string)
  default     = []
}

