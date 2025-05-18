# Staging environment configuration

# Set environment-specific variables
environment         = "staging"
aws_region          = "us-east-1"

# Network configuration
vpc_cidr            = "10.1.0.0/16"
availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
private_subnet_cidrs = ["10.1.4.0/24", "10.1.5.0/24", "10.1.6.0/24"]

# Compute configuration
instance_type       = "t3.medium"
key_name            = "staging-key"
min_size            = 2
max_size            = 4
desired_capacity    = 2

# Database configuration
db_instance_class   = "db.t3.small"
db_name             = "stagingdb"
db_username         = "stagingadmin"
db_password         = "StagingPassword123!" # In production, use AWS Secrets Manager

# CI/CD configuration
repository_name     = "example/terraform-aws-project"
repository_branch   = "staging"

# Default tags
default_tags = {
  Project     = "TerraformAWSProject"
  Environment = "staging"
  ManagedBy   = "Terraform"
  Owner       = "DevOpsTeam"
}
