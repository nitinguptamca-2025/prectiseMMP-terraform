resource "github_repository" "projects-mmp" {
  name        = "projects-mmp"
  visibility  = "private"
  description = "This repository is fully managed by Terraform"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  repository          = github_repository.projects-mmp.name
  file                = "README.md"
  content             = "# projects-mmp \n This repository is fully managed by Terraform modify by nitinguptamca-2025"
  commit_message      = "Add README.md"
  overwrite_on_create = true
}
