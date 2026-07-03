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
  dynamic "pages" {
    for_each = lookup(each.value, "pages", "false") == "true" ? [1] : []
    content {
      source {
        branch = "main"
        path   = "/"
      }
    }
    # provisioner "local-exec" {
    #   command = "gh repo view ${self.name} -w"
    # }

    # provisioner "local-exec" {
    #   when    = destroy
    #   command = "rm -rf ./cloned_repos/${self.name}"

    # }
  }
}
resource "terraform_data" "repo_clone" {
  for_each   = var.repos
  depends_on = [github_repository_file.readme, github_repository_file.main]
  provisioner "local-exec" {
    command = "gh repo clone ${github_repository.projects-mmp[each.key].name} "
  }
}
resource "github_repository_file" "readme" {
  for_each            = var.repos
  repository          = github_repository.projects-mmp[each.key].name
  file                = "README.md"
  commit_message      = "Add README.md"
  overwrite_on_create = true
  # content             = templatefile(template/readme.tpl)
  content = <<-EOT
Hello
World ${var.environment} repository
Terraform
EOT
}

resource "github_repository_file" "main" {
  for_each            = var.repos
  repository          = github_repository.projects-mmp[each.key].name
  branch              = "main"
  file                = "index.html"
  commit_message      = "Add index.html"
  overwrite_on_create = true
  content             = <<-EOT
   eana
   meena ${var.environment} repository
   dikka last time modify bu user ${data.github_user.current.name}
EOT
  # lifecycle {
  #   ignore_changes = [content]
  # }
}
