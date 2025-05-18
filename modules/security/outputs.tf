output "web_security_group_id" {
  description = "ID of the web security group"
  value       = aws_iam_instance_profile.ec2_profile.id
}
