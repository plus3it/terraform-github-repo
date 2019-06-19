provider "github" {}

resource "github_repository" "this" {
  name               = "${var.name}"
  description        = "${var.description}"
  homepage_url       = "${var.homepage_url}"
  has_issues         = "${var.enable_issues}"
  allow_merge_commit = "${var.enable_merge_commits}"
  allow_squash_merge = "${var.enable_squash_merging}"
  allow_rebase_merge = "${var.enable_rebase_merging}"
  auto_init          = "${var.enable_auto_init}"
  license_template   = "${var.license_template}"
  topics             = "${var.topics}"
  gitignore_template = "${var.gitignore_template}"
  has_projects       = "true"
}

resource "github_branch_protection" "this" {
  repository     = "${github_repository.this.name}"
  branch         = "${var.protected_branch}"
  enforce_admins = "${var.enforce_admins}"

  required_status_checks {
    strict   = "${var.enable_strict_checks}"
    contexts = "${var.required_status_checks}"
  }

  # Restrict who can dismiss pull requests
  required_pull_request_reviews {
    require_code_owner_reviews = "${var.enforce_code_owner_review}"
    dismissal_teams            = ["${data.github_team.restricted_pr_teams.*.name}"]
  }

  # Restrict who can push to the branch
  restrictions {
    teams = ["${data.github_team.restricted_push_teams.*.name}"]
  }
}

# Attach the team to the repository
resource "github_team_repository" "this" {
  count = "${length(var.access_teams)}"

  team_id    = "${data.github_team.access_teams.*.id[count.index]}"
  repository = "${github_repository.this.name}"
  permission = "pull"
}

# Get information about teams that already exist within the organization
data "github_team" "access_teams" {
  count = "${length(var.access_teams)}"

  slug = "${element(var.access_teams, count.index)}"
}

data "github_team" "restricted_pr_teams" {
  count = "${length(var.restricted_pr_teams)}"

  slug = "${element(var.restricted_pr_teams, count.index)}"
}

data "github_team" "restricted_push_teams" {
  count = "${length(var.restricted_push_teams)}"

  slug = "${element(var.restricted_push_teams, count.index)}"
}
