output "db_endpoint" {
  description = "RDS endpoint for the WordPress DB"
  value       = module.rds.db_endpoint
}

output "wordpress_public_ip" {
  value = module.wordpress_ec2.public_ip
}