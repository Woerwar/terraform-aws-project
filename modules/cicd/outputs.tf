output "pipeline_url" {
  description = "URL of the CI/CD pipeline"
  value       = "https://console.aws.amazon.com/codepipeline/home?region=${data.aws_region.current.name}#/view/${aws_codepipeline.main.name}"
}

data "aws_region" "current" {}
