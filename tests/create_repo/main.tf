module "repo" {
  source = "../../"

  name        = "test-terraform-github-repo-${random_string.this.result}"
  description = "description for random-${random_string.this.result}"

  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = true
  archive_on_destroy     = false
  auto_init              = true
  delete_branch_on_merge = true
  gitignore_template     = null
  has_issues             = true
  has_projects           = true
  has_wiki               = true
  homepage_url           = "https://some/url"
  license_template       = "apache-2.0"
  is_template            = false
  topics                 = ["test"]
  visibility             = "public"

  branch_protection = {
    enforce_admins         = true
    push_restrictions      = []
    require_signed_commits = false

    required_status_checks = {
      strict   = false
      contexts = ["github-actions"]
    }

    required_pull_request_reviews = {
      dismiss_stale_reviews           = true
      dismissal_restrictions          = []
      require_code_owner_reviews      = false
      required_approving_review_count = 1
    }
  }

  teams = []
}

resource "random_string" "this" {
  length  = 10
  upper   = false
  number  = false
  special = false
}

output "repo" {
  value = module.repo
}
