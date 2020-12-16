output "repo_name" {
  description = "The repository name in the form of `<organization>/<repository>`"
  value       = github_repository.this.full_name
}

output "repo_url" {
  description = "URL to the repository on the web"
  value       = github_repository.this.html_url
}

output "http_clone_url" {
  description = "URL that can be provided to `git clone` to clone the repository via HTTPS."
  value       = github_repository.this.http_clone_url
}

output "ssh_clone_url" {
  description = "URL that can be provided to `git clone` to clone the repository via SSH"
  value       = github_repository.this.ssh_clone_url
}

