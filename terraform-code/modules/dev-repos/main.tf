resource "random_id" "random" {
  byte_length = 2
  count       = 2
}

resource "github_repository" "mmp" {
  for_each    = var.repos
  name        = "mmp-${each.key}"
  description = "This ${var.repos[each.key].language} repository is fully managed by Terraform"
  visibility  = contains(var.env, "prod") ? "private" : "public"
  auto_init   = true
  # # pages {
  # #   source {
  # #     branch = "main"
  # #     path   = "/docs"
  # #   }
  # # }
  # dynamic "pages" {
  #   for_each = lookup(each.value, "pages", "false") == "true" ? [1] : []
  #   content {
  #     source {
  #       branch = "main"
  #       path   = "/"
  #     }
  #   }
  # }
  provisioner "local-exec" {
    command = "gh repo view ${self.name} -w"
  }

  provisioner "local-exec" {
    when    = destroy
    command = "rm -rf ${self.name}"
  }
}
resource "terraform_data" "repo_clone" {
  for_each   = var.repos
  depends_on = [github_repository_file.readme, github_repository_file.main]
  provisioner "local-exec" {
    command = "gh repo clone ${github_repository.mmp[each.key].name} "
  }
}
resource "github_repository_file" "readme" {
  for_each            = var.repos
  repository          = github_repository.mmp[each.key].name
  branch              = "main"
  file                = "README.md"
  commit_message      = "Add README.md"
  overwrite_on_create = true

  content = templatefile("${path.module}/templates/readme.tftpl",{
    env        = var.env[0], 
    language   = var.repos[each.key].language,
    repo_name  = github_repository.mmp[each.key].name,
    authorname = data.github_user.current.name,
  })
}

resource "github_repository_file" "main" {
  for_each            = var.repos
  repository          = github_repository.mmp[each.key].name
  branch              = "main"
  file                = each.value.filename
  commit_message      = "Add index.html"
  overwrite_on_create = true
  content             = <<-EOT
   eana
   meena ${var.env[0]} repository
   dikka last time modify bu user ${data.github_user.current.name}
EOT
  # lifecycle {
  #   ignore_changes = [content]
  # }
}

moved {
  from = github_repository_file.index
  to   = github_repository_file.main
}

resource "github_repository_pages" "mmp_pages" {
  # Filter the original map so this resource only runs for repos where pages == "true"
  for_each = { for k, v in var.repos : k => v if lookup(v, "pages", "false") == "true" }

  # Links it back to the specific repository created above
  repository = github_repository.mmp[each.key].name

  source {
    branch = "main"
    path   = "/"
  }
}
