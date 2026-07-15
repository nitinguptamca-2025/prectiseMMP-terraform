resource "random_id" "random" {
  byte_length = 3
  count       = 3
}

resource "github_repository" "mmp" {
  for_each    = var.repos
  name        = "mmp-${each.key}-${var.env}"
  description = "This ${var.repos[each.key].language} repository is fully managed by Terraform"
  visibility  = var.env == "prod" ? "private" : "public"
  auto_init   = true
  dynamic "pages" {
    for_each = lookup(each.value, "pages", "false") == "true" ? [1] : []
    content {
      source {
        branch = "main"
        path   = "/"
      }
    }
  }
  # provisioner "local-exec" {
  #   command = "gh repo view ${self.name} -w"
  # }

  # provisioner "local-exec" {
  #   when    = destroy
  #   command = "rm -rf ${self.name}"
  # }
}
resource "terraform_data" "repo_clone" {
  for_each   = var.repos
  depends_on = [github_repository_file.readme, github_repository_file.main]
  # provisioner "local-exec" {
  #   command = "gh repo clone ${github_repository.mmp[each.key].name} "
  # }
}
resource "github_repository_file" "readme" {
  for_each            = var.repos
  repository          = github_repository.mmp[each.key].name
  branch              = "main"
  file                = "README.md"
  commit_message      = "Add README.md"
  overwrite_on_create = true

  content = templatefile("${path.module}/templates/readme.tftpl", {
    env        = var.env,
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
   meena ${var.env} repository
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

