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
#   source = "./modules/old-prectise/dev-repos"
#   for_each = toset(local.environments)
#   repo_count = 2
#   env        = each.key
#   repos      = local.repos
# }
# module "deploy-key" {
#   for_each =toset(flatten([for k, v in module.repos : keys(v.clone-urls) if k == "dev"]))
#   source     = "./modules/old-prectise/deploy-key"
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
#   source = "./modules/old-prectise/maps-and-Lookups-pt1"
#   ext_port = [1880]
# }


# module "maps-And-Lookups-pt2" {
#   source = "./modules/old-prectise/maps-And-Lookups-pt2"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }

# module "path-References-Interpolation" {
#   source   = "./modules/old-prectise/path-References-Interpolation"
#   ext_port = [1880, 1881, 1882]
# }


# module "referencing-Workspaces" {
#   source = "./old-prectise/modules/referencing-Workspaces"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }

# module "workspaces" {
#   source = "./modules/old-prectise/workspaces"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }


# module "map-Keys-And-Lookup-Defaults" {
#   source = "./modules/old-prectise/map-Keys-And-Lookup-Defaults"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }


module "01-first-Module-Image" {
  source = "./modules/01-first-Module-Image"
  ext_port = {
    dev  = [1980, 1981]
    prod = [1880, 1881]
  }
}

# module "_02-Module-Variables" {
#   source = "./modules/_02-Module-Variables"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }

# module "_03-Terraform-Graph" {
#   source = "./modules/_03-Terraform-Graph"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }


# module "_04-Dependencies" {
#   source = "./modules/_04-Dependencies"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }
# module "_05-Container-Module" {
#   source = "./modules/_05-Container-Module"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }
# module "_06-Container-Module-Outputs" {
#   source = "./modules/_06-Container-Module-Outputs"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }
# module "_08-Docker-Volume" {
#   source = "./modules/_08-Docker-Volume"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }
# module "_08-Lifecycle-Policies" {
#   source = "./modules/_08-Lifecycle-Policies"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }
# module "_09-Multiple-Resource-Module" {
#   source = "./modules/_09-Multiple-Resource-Module"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }
# module "_10-For-Each-Image" {
#   source = "./modules/_10-For-Each-Image"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }
# module "_11-For-Each-Container" {
#   source = "./modules/_11-For-Each-Container"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }
# module "_12-For-Each-Count" {
#   source = "./modules/_12-For-Each-Count"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }

# module "_13-Grafana" {
#   source = "./modules/_13-Grafana"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }

# module "_14-Self-Referencing" {
#   source = "./modules/_14-Self-Referencing"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }

# module "_15-Self-Referencing-Apply-Yourself-Solution" {
#   source = "./modules/_15-Self-Referencing-Apply-Yourself-Solution"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }
# module "_16-Dynamic-Blocks" {
#   source = "./modules/_16-Dynamic-Blocks"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }

# module "_17-Nested-Modules" {
#   source = "./modules/_17-Nested-Modules"
#   ext_port = {
#     dev  = [1980, 1981]
#     prod = [1880, 1881]
#   }
# }