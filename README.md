## terraform-github-repo

A terraform module to create an organization repository and
configure team access as well as branch protections.
Note: this will only create an organizational repository

<!-- BEGIN TFDOCS -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| github | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| access\_teams | List of maps with the `name` of the team that can access the repository and its `permission` (e.g., [{name = test, permission = pull}]) | `list(any)` | `[]` | no |
| description | Description for the repository being created | `string` | `"A Terraform Module"` | no |
| enable\_auto\_init | Automatically initialize the repository upon creation | `bool` | `false` | no |
| enable\_issues | Enable the GitHub Issues features on the repository | `bool` | `false` | no |
| enable\_merge\_commits | Whether or not to allow merge commits | `bool` | `false` | no |
| enable\_projects | Enable the GitHub Projects features on the repository | `bool` | `false` | no |
| enable\_rebase\_merging | Whether or not to allow rebase merging | `bool` | `false` | no |
| enable\_squash\_merging | Whether or not to allow squash merging | `bool` | `false` | no |
| enable\_strict\_checks | Require branches to be up to date before merging. | `bool` | `false` | no |
| enforce\_admins | Enforces status checks on repository administrators | `bool` | `false` | no |
| enforce\_code\_owner\_review | Require an approved review in pull requests including files with a designated code owner | `bool` | `false` | no |
| gitignore\_template | Gitignore template to include in the repository | `string` | `null` | no |
| homepage\_url | URL of a page describing the project. | `string` | `null` | no |
| license\_template | Type of license to include in the repository | `string` | `"apache-2.0"` | no |
| name | The name of the repostory to create | `string` | `null` | no |
| protected\_branch | The branch to protect | `string` | `"master"` | no |
| required\_status\_checks | The list of status checks to require in order to merge into this branch. | `list(string)` | `[]` | no |
| restricted\_pr\_teams | List of organizational teams who can dismiss a pull request | `list(string)` | `[]` | no |
| restricted\_push\_teams | List of organizational teams who can push to the branch | `list(string)` | `[]` | no |
| topics | List of topics to apply to the repository | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| http\_git\_clone | URL that can be provided to `git clone` to clone the repository via HTTPS. |
| repo\_name | The repository name in the form of `<organization>/<repository>` |
| repo\_url | URL to the repository on the web |
| ssh\_git\_clone | URL that can be provided to `git clone` to clone the repository via SSH |

<!-- END TFDOCS -->
