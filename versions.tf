terraform {
  required_version = ">= 0.14"

  experiments = [module_variable_optional_attrs]

  required_providers {
    github = {
      source  = "registry.terraform.io/hashicorp/github"
      version = ">= 4.0"
    }
  }
}
