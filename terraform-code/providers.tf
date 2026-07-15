# terraform {
#   required_providers {
#     github = {
#       source  = "integrations/github"
#       version = "~> 6.0"
#     }
#   }
# }
# provider "github" {
#   owner = "nitinguptamca-2025" # Replace with your GitHub username
# }

terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0" # or your desired version
    }
  }
}

provider "docker" {
  registry_auth {
    address  = "registry.hub.docker.com"
    username = "nitinguptamca"
    password = "Gurukul700@#"
  }
}