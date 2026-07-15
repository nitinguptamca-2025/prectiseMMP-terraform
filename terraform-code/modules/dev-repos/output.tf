

output "clone-urls" {
  value = {
    for i in github_repository.mmp : i.name => {
      ssh-clone-url  = i.ssh_clone_url,
      http-clone-url = i.http_clone_url,
      pages-url      = try(i.pages[0].html_url, "no_pages")
      # pages-url = github_repository_pages.mmp_pages[k].html_url
    }
  }
  description = "repository Names and URL"
  sensitive   = false
}
output "repository_names" {
  description = "Map of created repository names keyed by their map key"
  value       = { for k, v in github_repository.mmp : k => v.name }
}