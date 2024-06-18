resource "aws_db_instance" "mysql" {
  identifier         = "mysql"
  allocated_storage  = 20
  storage_type       = "gp2"
  engine             = "mysql"
  engine_version     = "8.0.35"
  instance_class     = "db.t3.micro"
  db_name               = "wordpressdb"
  username           =    "admin"
  password           =    "adminadmin"
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  skip_final_snapshot = true
  tags = {
    Name = "mysql"
  }
}
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "db_subnet_group"
  subnet_ids = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]  
  tags = {
    Name = "db_subnet_group"
  }
}