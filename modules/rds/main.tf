resource "aws_db_subnet_group" "this" {
  name       = "mysql-subnet-group"
  subnet_ids = var.private_subnet_ids
  tags = {
    Name = "MySQL Subnet Group"
  }
}

resource "aws_db_instance" "this" {
  identifier              = "mysql"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  allocated_storage       = 20
  storage_type            = "gp2"
  db_name                 = "wordpress"
  username                = "admin"
  password                = var.db_password
  db_subnet_group_name    = aws_db_subnet_group.this.name
  vpc_security_group_ids  = [var.rds_sg_id]
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false
}