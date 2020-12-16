resource "github_repository" "this" {
  name = var.name

  allow_merge_commit     = var.allow_merge_commit
  allow_squash_merge     = var.allow_squash_merge
  allow_rebase_merge     = var.allow_rebase_merge
  archive_on_destroy     = var.archive_on_destroy
  auto_init              = var.auto_init
  delete_branch_on_merge = var.delete_branch_on_merge
  description            = var.description
  gitignore_template     = var.gitignore_template
  has_issues             = var.has_issues
  has_projects           = var.has_projects
  has_wiki               = var.has_wiki
  homepage_url           = var.homepage_url
  is_template            = var.is_template
  license_template       = var.license_template
  topics                 = var.topics
  visibility             = var.visibility
  vulnerability_alerts   = var.vulnerability_alerts

  dynamic "template" {
    for_each = var.template != null ? [var.template] : []
    content {
      owner      = template.value.owner
      repository = template.value.repository
    }
  }
}

resource "github_branch_protection" "this" {
  count = var.branch_protection != null ? 1 : 0

  pattern       = github_repository.this.default_branch
  repository_id = github_repository.this.node_id

  enforce_admins         = var.branch_protection.enforce_admins
  push_restrictions      = var.branch_protection.push_restrictions
  require_signed_commits = var.branch_protection.require_signed_commits

  dynamic "required_status_checks" {
    for_each = var.branch_protection.required_status_checks != null ? [var.branch_protection.required_status_checks] : []
    content {
      strict   = required_status_checks.value.strict
      contexts = required_status_checks.value.contexts
    }
  }

  dynamic "required_pull_request_reviews" {
    for_each = var.branch_protection.required_pull_request_reviews != null ? [var.branch_protection.required_pull_request_reviews] : []
    content {
      dismiss_stale_reviews           = required_pull_request_reviews.value.dismiss_stale_reviews
      dismissal_restrictions          = required_pull_request_reviews.value.dismissal_restrictions
      require_code_owner_reviews      = required_pull_request_reviews.value.require_code_owner_reviews
      required_approving_review_count = required_pull_request_reviews.value.required_approving_review_count
    }
  }

  depends_on = [
    github_team_repository.this
  ]
}

# Attach the teams to the repository
resource "github_team_repository" "this" {
  for_each = { for team in var.teams : team.name => team }

  team_id    = data.github_team.teams[each.key].id
  repository = github_repository.this.name
  permission = each.value.permission
}

# Get information about specified teams so we have the team_id
data "github_team" "teams" {
  for_each = { for team in var.teams : team.name => team }

  slug = each.key
}
