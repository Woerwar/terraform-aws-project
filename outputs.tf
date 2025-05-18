output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}

output "public_subnet_ids" {
  description = "IDs of the public subnets"
  value       = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  description = "IDs of the private subnets"
  value       = module.network.private_subnet_ids
}

output "web_security_group_id" {
  description = "ID of the web security group"
  value       = module.security.web_security_group_id
}

output "db_security_group_id" {
  description = "ID of the database security group"
  value       = module.database.db_security_group_id
}

output "alb_dns_name" {
  description = "DNS name of the application load balancer"
  value       = module.compute.alb_dns_name
}

output "db_endpoint" {
  description = "Endpoint of the RDS database"
  value       = module.database.db_endpoint
}

output "cicd_pipeline_url" {
  description = "URL of the CI/CD pipeline"
  value       = module.cicd.pipeline_url
}
