variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "sg_name" {
  description = "Name tag for the security group"
  type        = string
}

variable "ingress_ports" {
  description = "List of ports to allow inbound"
  type        = list(number)
}