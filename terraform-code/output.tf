output "clone-urls" {
  value = {
    for i in github_repository.mmp : i.name => {
      ssh-clone-url  = i.ssh_clone_url,
      http-clone-url = i.http_clone_url,
      pages-url      = i.pages[0].html_url
      # pages-url = github_repository_pages.mmp_pages[k].html_url
    }
  }
  description = "repository Names and URL"
  sensitive   = false
}