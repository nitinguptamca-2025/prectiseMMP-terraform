repo_count = 2
#varsource  = "terraform.tfvars"
env = ["dev" , "prod"]
repos = { "infra" = {
  language = "terraform"
  filename = "main.tf"
  pages    = "true"
  }, "backend" = {
  language = "python"
  filename = "main.py"
  pages    = "false"

} }
