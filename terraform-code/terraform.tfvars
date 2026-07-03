repo_count = 2
#varsource  = "terraform.tfvars"
environment = "dev"
repos = { "infra" = {
  language = "terraform"
  filename = "main.tf"
  }, "backend" = {
  language = "python"
  filename = "main.py"
} }
