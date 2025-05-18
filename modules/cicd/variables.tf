variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "repository_name" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "repository_branch" {
  description = "Branch of the GitHub repository to use for CI/CD"
  type        = string
}
