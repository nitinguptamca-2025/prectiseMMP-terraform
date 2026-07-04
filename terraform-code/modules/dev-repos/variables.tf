variable "repo_count" {
  type        = number
  description = "Number of repositories to create"
  default     = 2
  validation {
    condition     = var.repo_count < 10
    error_message = "The number of repositories must be less than 5."
  }
}
variable "env" {
  type        = list(string)
  description = "deployment environment"
  default     = ["dev"]
  validation {
    condition     = length(var.env) > 0
    error_message = "At least one environment must be specified."
  }
}
variable "repos" {
  type        = map(map(string))
  description = "Map of repository names to their respective languages and files"
}
variable "repo_max" {
  type        = number
  description = "Maximum number of repositories allowed"
  default     = 5
  validation {
    condition     = var.repo_max < 10
    error_message = "The number of repositories must not exceed the maximum limit of ${var.repo_max}."
  }
}
 