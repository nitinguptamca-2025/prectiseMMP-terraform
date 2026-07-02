terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# The provider block can remain empty if environment variables 
# (GITHUB_TOKEN and GITHUB_OWNER) are set.
provider "github" {
  owner = "nitinguptamca-2025" # Replace with your GitHub username
}

# Create a new GitHub Repository
resource "github_repository" "example" {
  name        = "prectiseMMP-terraform"
  description = "This repository is fully managed by Terraform"
  visibility  = "public"

  # Initialize with a README
  auto_init = true
}