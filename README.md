## terraform-github-repo

A terraform module to create an organization repository and
configure team access as well as branch protections.
Note: this will only create an organizational repository

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| access\_teams | List of maps with the `name` of the team that can access the repository and its `permission` (e.g., [{name = test, permission = pull}]) | list | `<list>` | no |
| description | Description for the repository being created | string | `"A Terraform Module"` | no |
| enable\_auto\_init | Automatically initialize the repository upon creation | string | `"false"` | no |
| enable\_issues | Enable the GitHub Issues features on the repository | string | `"false"` | no |
| enable\_merge\_commits | Whether or not to allow merge commits | string | `"false"` | no |
| enable\_projects | Enable the GitHub Projects features on the repository | string | `"false"` | no |
| enable\_rebase\_merging | Whether or not to allow rebase merging | string | `"false"` | no |
| enable\_squash\_merging | Whether or not to allow squash merging | string | `"false"` | no |
| enable\_strict\_checks | Require branches to be up to date before merging. | string | `"false"` | no |
| enforce\_admins | Enforces status checks on repository administrators | string | `"false"` | no |
| enforce\_code\_owner\_review | Require an approved review in pull requests including files with a designated code owner | string | `"false"` | no |
| gitignore\_template | Gitignore template to include in the repository | string | `""` | no |
| homepage\_url | URL of a page describing the project. | string | `""` | no |
| license\_template | Type of license to include in the repository | string | `"apache-2.0"` | no |
| name | The name of the repostory to create | string | n/a | yes |
| protected\_branch | The branch to protect | string | `"master"` | no |
| required\_status\_checks | The list of status checks to require in order to merge into this branch. | list | `<list>` | no |
| restricted\_pr\_teams | List of organizational teams who can dismiss a pull request | list | `<list>` | no |
| restricted\_push\_teams | List of organizational teams who can push to the branch | list | `<list>` | no |
| topics | List of topics to apply to the repository | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| http\_git\_clone | URL that can be provided to `git clone` to clone the repository via HTTPS. |
| repo\_name | The repository name in the form of `<organization>/<repository>` |
| repo\_url | URL to the repository on the web |
| ssh\_git\_clone | URL that can be provided to `git clone` to clone the repository via SSH |

