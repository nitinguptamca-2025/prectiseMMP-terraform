locals {
  repos = {
    "infra" = {
      language = "terraform"
      filename = "main.tf"
      pages    = "true"
    },
    "backend" = {
      language = "python"
      filename = "main.py"
      pages    = "false"
    }
  }
  environments = ["dev", "prod"]
}

module "repos" {
  source = "./modules/dev-repos"
  for_each = toset(local.environments)
  repo_count = 2
  env        = each.key
  repos      = local.repos
}