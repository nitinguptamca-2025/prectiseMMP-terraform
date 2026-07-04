repo_count = 2
#varsource  = "terraform.tfvars"
env = ["dev" ,"qa", "prod"]
repos = { "infra" = {
  language = "terraform"
  filename = "main.tf"
  pages    = "true"
  }, "backend" = {
  language = "python"
  filename = "main.py"
  pages    = "false"

} }
