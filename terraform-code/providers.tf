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