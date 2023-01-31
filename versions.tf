terraform {
  required_version = ">= 0.14"

  required_providers {
    github = {
      source  = "registry.terraform.io/integrations/github"
      version = ">= 4.0"
    }
  }
}
