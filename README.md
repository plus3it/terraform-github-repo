## terraform-github-repo

A terraform module to create an organization repository and
configure team access as well as branch protections.
Note: this will only create an organizational repository

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_github"></a> [github](#requirement\_github) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | >= 4.0 |

## Resources

| Name | Type |
|------|------|

| github_team.teams | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the repository | `string` | n/a | yes |
| <a name="input_allow_merge_commit"></a> [allow\_merge\_commit](#input\_allow\_merge\_commit) | Whether to allow merge commits | `bool` | `false` | no |
| <a name="input_allow_rebase_merge"></a> [allow\_rebase\_merge](#input\_allow\_rebase\_merge) | Whether to allow rebase merging | `bool` | `true` | no |
| <a name="input_allow_squash_merge"></a> [allow\_squash\_merge](#input\_allow\_squash\_merge) | Whether to allow squash merging | `bool` | `false` | no |
| <a name="input_archive_on_destroy"></a> [archive\_on\_destroy](#input\_archive\_on\_destroy) | Whether to archive on destroy instead of delete | `bool` | `false` | no |
| <a name="input_auto_init"></a> [auto\_init](#input\_auto\_init) | Automatically initialize the repository upon creation | `bool` | `true` | no |
| <a name="input_branch_protection"></a> [branch\_protection](#input\_branch\_protection) | Branch protection configuration | <pre>object({<br>    enforce_admins         = optional(bool)<br>    push_restrictions      = optional(list(string))<br>    require_signed_commits = optional(bool)<br>    required_status_checks = optional(object({<br>      strict   = optional(bool)<br>      contexts = list(string)<br>    }))<br>    required_pull_request_reviews = optional(object({<br>      dismiss_stale_reviews           = optional(bool)<br>      dismissal_restrictions          = optional(list(string))<br>      require_code_owner_reviews      = optional(bool)<br>      required_approving_review_count = number<br>    }))<br>  })</pre> | `null` | no |
| <a name="input_delete_branch_on_merge"></a> [delete\_branch\_on\_merge](#input\_delete\_branch\_on\_merge) | Automatically delete head branch after a pull request is merged | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the repository | `string` | `null` | no |
| <a name="input_gitignore_template"></a> [gitignore\_template](#input\_gitignore\_template) | Gitignore template to include in the repository | `string` | `null` | no |
| <a name="input_has_issues"></a> [has\_issues](#input\_has\_issues) | Enable the GitHub Issues features on the repository | `bool` | `true` | no |
| <a name="input_has_projects"></a> [has\_projects](#input\_has\_projects) | Enable the GitHub Projects features on the repository | `bool` | `false` | no |
| <a name="input_has_wiki"></a> [has\_wiki](#input\_has\_wiki) | Enable the GitHub Wiki features on the repository | `bool` | `false` | no |
| <a name="input_homepage_url"></a> [homepage\_url](#input\_homepage\_url) | URL of a page describing the project | `string` | `null` | no |
| <a name="input_is_template"></a> [is\_template](#input\_is\_template) | Configure this repository as a template repository | `bool` | `false` | no |
| <a name="input_license_template"></a> [license\_template](#input\_license\_template) | Type of license to include in the repository | `string` | `null` | no |
| <a name="input_teams"></a> [teams](#input\_teams) | List of teams to grant permissions to the repository | <pre>list(object({<br>    name       = string<br>    permission = optional(string)<br>  }))</pre> | `[]` | no |
| <a name="input_template"></a> [template](#input\_template) | Template repository used to create this repository | <pre>object({<br>    owner      = string<br>    repository = string<br>  })</pre> | `null` | no |
| <a name="input_topics"></a> [topics](#input\_topics) | List of topics to apply to the repository | `list(string)` | `[]` | no |
| <a name="input_visibility"></a> [visibility](#input\_visibility) | Visibility of the repository. One of: `public`, `private`, or `internal` | `string` | `"public"` | no |
| <a name="input_vulnerability_alerts"></a> [vulnerability\_alerts](#input\_vulnerability\_alerts) | Whether to enable security alerts for dependencies | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_repo"></a> [repo](#output\_repo) | Object with all repo attributes |

<!-- END TFDOCS -->
