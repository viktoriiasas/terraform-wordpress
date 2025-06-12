variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
}

variable "ingress_ports" {
  description = "Ports to allow in EC2 SG"
  type        = list(number)
  default     = [22, 80, 443, 3306] # SSH, HTTP, HTTPS, MySQL
}


variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
}

variable "key_name" {
  description = "Name of the existing EC2 key pair"
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Type of EC2 instance"
  type        = string
}

variable "db_password" {
  description = "Password for the RDS MySQL admin user"
  type        = string
  sensitive   = true
}