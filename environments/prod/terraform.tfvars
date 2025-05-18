# Production environment configuration

# Set environment-specific variables
environment         = "prod"
aws_region          = "us-east-1"

# Network configuration
vpc_cidr            = "10.2.0.0/16"
availability_zones  = ["us-east-1a", "us-east-1b", "us-east-1c"]
public_subnet_cidrs = ["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
private_subnet_cidrs = ["10.2.4.0/24", "10.2.5.0/24", "10.2.6.0/24"]

# Compute configuration
instance_type       = "t3.large"
key_name            = "prod-key"
min_size            = 3
max_size            = 6
desired_capacity    = 3

# Database configuration
db_instance_class   = "db.t3.medium"
db_name             = "proddb"
db_username         = "prodadmin"
db_password         = "ProdPassword123!" # In production, use AWS Secrets Manager

# CI/CD configuration
repository_name     = "example/terraform-aws-project"
repository_branch   = "main"

# Default tags
default_tags = {
  Project     = "TerraformAWSProject"
  Environment = "prod"
  ManagedBy   = "Terraform"
  Owner       = "OpsTeam"
}
