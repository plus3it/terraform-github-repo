## terraform-github-repo

A terraform module to create an organization repository and
configure team access as well as branch protections.
Note: this will only create an organizational repository

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14 |
| github | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| github | >= 4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| name | Name of the repository | `string` | n/a | yes |
| allow\_merge\_commit | Whether to allow merge commits | `bool` | `false` | no |
| allow\_rebase\_merge | Whether to allow rebase merging | `bool` | `true` | no |
| allow\_squash\_merge | Whether to allow squash merging | `bool` | `false` | no |
| archive\_on\_destroy | Whether to archive on destroy instead of delete | `bool` | `false` | no |
| auto\_init | Automatically initialize the repository upon creation | `bool` | `true` | no |
| branch\_protection | Branch protection configuration | <pre>object({<br>    enforce_admins         = optional(bool)<br>    push_restrictions      = optional(list(string))<br>    require_signed_commits = optional(bool)<br>    required_status_checks = optional(object({<br>      strict   = optional(bool)<br>      contexts = list(string)<br>    }))<br>    required_pull_request_reviews = optional(object({<br>      dismiss_stale_reviews           = optional(bool)<br>      dismissal_restrictions          = optional(list(string))<br>      require_code_owner_reviews      = optional(bool)<br>      required_approving_review_count = number<br>    }))<br>  })</pre> | `null` | no |
| delete\_branch\_on\_merge | Automatically delete head branch after a pull request is merged | `bool` | `true` | no |
| description | Description of the repository | `string` | `null` | no |
| gitignore\_template | Gitignore template to include in the repository | `string` | `null` | no |
| has\_issues | Enable the GitHub Issues features on the repository | `bool` | `true` | no |
| has\_projects | Enable the GitHub Projects features on the repository | `bool` | `false` | no |
| has\_wiki | Enable the GitHub Wiki features on the repository | `bool` | `false` | no |
| homepage\_url | URL of a page describing the project | `string` | `null` | no |
| is\_template | Configure this repository as a template repository | `bool` | `false` | no |
| license\_template | Type of license to include in the repository | `string` | `null` | no |
| teams | List of teams to grant permissions to the repository | <pre>list(object({<br>    name       = string<br>    permission = optional(string)<br>  }))</pre> | `[]` | no |
| template | Template repository used to create this repository | <pre>list(object({<br>    owner      = string<br>    repository = string<br>  }))</pre> | `null` | no |
| topics | List of topics to apply to the repository | `list(string)` | `[]` | no |
| visibility | Visibility of the repository. One of: `public`, `private`, or `internal` | `string` | `"public"` | no |
| vulnerability\_alerts | Whether to enable security alerts for dependencies | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| repo | Object with all repo attributes |

<!-- END TFDOCS -->
