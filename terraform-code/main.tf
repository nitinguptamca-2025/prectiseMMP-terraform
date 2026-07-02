resource "github_repository" "projects-mmp" {
  name       = "projects-mmp"
  visibility = "private"
  description = "This repository is fully managed by Terraform"
  auto_init  = true
}