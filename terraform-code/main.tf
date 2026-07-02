resource "random_id" "random" {
  byte_length = 2
  count       = 2

}
resource "github_repository" "projects-mmp" {
  count = var.repo_count
  name  = "projects-mmp-${random_id.random[count.index].hex}"
  # name        = "projects-mmp"
  visibility  = "private"
  description = "This repository is fully managed by Terraform"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  count               = var.repo_count
  repository          = github_repository.projects-mmp[count.index].name
  file                = "README.md"
  commit_message      = "Add README.md"
  overwrite_on_create = true
  content             = <<-EOT
Hello
World
Terraform
EOT
}

resource "github_repository_file" "index" {
  count               = 2
  repository          = github_repository.projects-mmp[count.index].name
  file                = "index.html"
  commit_message      = "Add index.html"
  overwrite_on_create = true
  content             = <<-EOT
   eana
   meena
   dikka
EOT
}

output "repository_names" {
  value       = [for repo in github_repository.projects-mmp : repo.name]
  description = "List of created repository names"
}

output "clone-urls" {
  value       = { for i in github_repository.projects-mmp : i.name => i.http_clone_url }
  description = "List of clone URLs for the created repositories"
  sensitive   = false
}
# output "varsource" {
#   value       = var.varsource
#   description = "Source of the variable"
# }