variable "private_subnet_ids" {
  description = "List of private subnet IDs for RDS"
  type        = list(string)
}

variable "db_password" {
  description = "Password for RDS admin user"
  type        = string
  sensitive   = true
}

variable "rds_sg_id" {
  description = "Security group ID for RDS"
  type        = string
}