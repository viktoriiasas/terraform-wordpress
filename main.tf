
module "network" {
  source              = "./modules/network"
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones  = var.availability_zones
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}

module "wordpress_sg" {
  source        = "./modules/security"
  vpc_id        = module.network.vpc_id
  sg_name       = "wordpress-sg"
  ingress_ports = var.ingress_ports
}

module "wordpress_ec2" {
  source             = "./modules/ec2"
  ami                =  var.ami
  instance_type      =  var.instance_type
  public_subnet_ids  = module.network.public_subnet_ids
  security_group_id  = module.wordpress_sg.security_group_id
  key_name           = var.key_name
}


module "rds" {
  source             = "./modules/rds"
  private_subnet_ids = module.network.private_subnet_ids
  db_password        = var.db_password
  rds_sg_id          = module.wordpress_sg.security_group_id
}