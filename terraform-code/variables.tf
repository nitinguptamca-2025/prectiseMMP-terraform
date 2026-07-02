variable "repo_count" {
  type        = number
  description = "Number of repositories to create"
  default     = 1
  validation {
    condition     = var.repo_count < 5
    error_message = "The number of repositories must be less than 5."
  }
}
variable "environment" {
  type        = string
  description = "deployment environment"
  validation {
    condition = contains(["dev", "qa", "prod"], var.environment)
    # condition     = var.environment == "dev" || var.environment == "qa" || var.environment == "prod"
    error_message = "The variable must be one of 'dev', 'qa', or 'prod'."
  }
}
