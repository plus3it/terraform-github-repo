provider "github" {}

resource "random_string" "this" {
  length  = 10
  upper   = false
  number  = false
  special = false
}

module "create_repo" {
  source = "../../"
  providers = {
    github = github
  }

  name                   = "random-${random_string.this.result}"
  enable_merge_commits   = true
  enable_squash_merging  = true
  enable_rebase_merging  = false
}
