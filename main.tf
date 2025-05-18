provider "aws" {
  region = var.aws_region
  default_tags {
    tags = var.default_tags
  }
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    # These values must be provided via terraform init command
    # terraform init -backend-config="bucket=your-terraform-state-bucket" -backend-config="key=terraform.tfstate" -backend-config="region=us-east-1"
  }
}

# Network Module
module "network" {
  source = "./modules/network"

  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  environment          = var.environment
}

# Compute Module
module "compute" {
  source = "./modules/compute"

  vpc_id                  = module.network.vpc_id
  public_subnet_ids       = module.network.public_subnet_ids
  private_subnet_ids      = module.network.private_subnet_ids
  environment             = var.environment
  instance_type           = var.instance_type
  key_name                = var.key_name
  min_size                = var.min_size
  max_size                = var.max_size
  desired_capacity        = var.desired_capacity
  depends_on              = [module.network]
}

# Database Module
module "database" {
  source = "./modules/database"

  vpc_id                  = module.network.vpc_id
  private_subnet_ids      = module.network.private_subnet_ids
  environment             = var.environment
  db_instance_class       = var.db_instance_class
  db_name                 = var.db_name
  db_username             = var.db_username
  db_password             = var.db_password
  depends_on              = [module.network]
}

# Security Module
module "security" {
  source = "./modules/security"

  vpc_id                  = module.network.vpc_id
  environment             = var.environment
  depends_on              = [module.network]
}

# CI/CD Module
module "cicd" {
  source = "./modules/cicd"

  environment             = var.environment
  repository_name         = var.repository_name
  repository_branch       = var.repository_branch
  depends_on              = [module.compute, module.database]
}
