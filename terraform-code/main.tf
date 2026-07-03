resource "random_id" "random" {
  byte_length = 2
  count       = 2

}
resource "github_repository" "projects-mmp" {
  for_each    = var.repos
  name        = "projects-mmp-${each.key}"
  description = "This repository is fully managed by Terraform"
  visibility  = var.environment == "prod" ? "private" : "public"
  auto_init   = true
  # provisioner "local-exec" {
  #   command = "gh repo view ${self.name} -w"
  # }

  # provisioner "local-exec" {
  #   when    = destroy
  #   command = "rm -rf ./cloned_repos/${self.name}"

  # }
}

# resource "terraform_data" "repo_clone" {
#   for_each   = var.repos
#   depends_on = [github_repository_file.readme, github_repository_file.index]
#   provisioner "local-exec" {
#     command = "gh repo clone ${github_repository.projects-mmp[each.key].name} "
#   }
# }
resource "github_repository_file" "readme" {
  for_each            = var.repos
  repository          = github_repository.projects-mmp[each.key].name
  file                = "README.md"
  commit_message      = "Add README.md"
  overwrite_on_create = true
  content             = <<-EOT
Hello
World ${var.environment} repository
Terraform
EOT
}

resource "github_repository_file" "index" {
  for_each            = var.repos
  repository          = github_repository.projects-mmp[each.key].name
  file                = "index.html"
  commit_message      = "Add index.html"
  overwrite_on_create = true
  content             = <<-EOT
   eana
   meena ${var.environment} repository
   dikka
EOT
}

output "repository_names" {
  value       = { for repo in github_repository.projects-mmp : repo.name => [repo.ssh_clone_url, repo.http_clone_url] }
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