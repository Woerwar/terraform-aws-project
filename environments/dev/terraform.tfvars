# Dev environment configuration

# Set environment-specific variables
environment         = "dev"
aws_region          = "us-east-1"

# Network configuration
vpc_cidr            = "10.0.0.0/16"
availability_zones  = ["us-east-1a", "us-east-1b"]
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24"]

# Compute configuration
instance_type       = "t3.micro"
key_name            = "dev-key"
min_size            = 1
max_size            = 2
desired_capacity    = 1

# Database configuration
db_instance_class   = "db.t3.micro"
db_name             = "devdb"
db_username         = "devadmin"
db_password         = "DevPassword123!" # In production, use AWS Secrets Manager

# CI/CD configuration
repository_name     = "example/terraform-aws-project"
repository_branch   = "dev"

# Default tags
default_tags = {
  Project     = "TerraformAWSProject"
  Environment = "dev"
  ManagedBy   = "Terraform"
  Owner       = "DevTeam"
}
