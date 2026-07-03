repo_count = 2
#varsource  = "terraform.tfvars"
environment = "dev"
repos = { "prod" = {
  language = "terraform"
  file     = "main.tf"
  }, "dev" = {
  language = "python"
  file     = "main.py"
  }, "qa" = {
  language = "java"
  file     = "Main.java"
  }, "infra" = {
  language = "yaml"
  file     = "main.yaml"
  }, "backend" = {
  language = "javascript"
  file     = "main.js"
} }
