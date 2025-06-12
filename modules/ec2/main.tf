resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = element(var.public_subnet_ids, 0)
  vpc_security_group_ids = [var.security_group_id]
  key_name      = var.key_name

  tags = {
    Name = "wordpress-ec2"
  }

  user_data = file("${path.module}/user_data.sh")
}