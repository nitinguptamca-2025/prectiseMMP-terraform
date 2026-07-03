output "repository_names" {
  value       = { for repo in github_repository.projects-mmp : repo.name => [repo.ssh_clone_url, repo.http_clone_url] }
  description = "List of created repository names"
}

moved {
  from = github_repository_file.index
  to = github_repository_file.main
}