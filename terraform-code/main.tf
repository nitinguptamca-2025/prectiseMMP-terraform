# locals {
#   repos = {
#     "infra" = {
#       language = "terraform"
#       filename = "main.tf"
#       pages    = "true"
#     },
#     "backend" = {
#       language = "python"
#       filename = "main.py"
#       pages    = "false"
#     },
#     "frontend" = {
#       language = "javascript"
#       filename = "main.js"
#       pages    = "false"
#     }
#   }
#   environments = ["dev","staging", "prod"]
# }

# module "repos" {
#   source = "./modules/dev-repos"
#   for_each = toset(local.environments)
#   repo_count = 2
#   env        = each.key
#   repos      = local.repos
# }
# module "deploy-key" {
#   for_each =toset(flatten([for k, v in module.repos : keys(v.clone-urls) if k == "dev"]))
#   source     = "./modules/deploy-key"
#   # DO NOT hardcode the name. Reference the created resource name dynamically:
#   repo_name = each.key
# }
# output "repo-info" {
#   value = { for k, v in module.repos : k => v.clone-urls }
# }

# output "repo-iist" {
#   value = flatten([for k, v in module.repos : keys(v.clone-urls) if k == "dev"])
# }

# module "docker" {
#   source = "./modules/docker"
#   ext_port = [ 1880, 1881, 1882 ]
# }
# module "maps-and-Lookups-pt1" {
#   source = "./modules/maps-and-Lookups-pt1"
#   ext_port = [1880]
# }


# module "maps-And-Lookups-pt2" {
#   source = "./modules/maps-And-Lookups-pt2"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }

module "path-References-Interpolation" {
  source   = "./modules/path-References-Interpolation"
  ext_port = [1880, 1881, 1882]
}
