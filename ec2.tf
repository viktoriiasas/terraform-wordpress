resource "aws_instance" "wordpress_ec2" {
  ami                    = "ami-0eaf7c3456e7b5b68" 
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.ssh_key.key_name
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.wordpress_sg.id]
  associate_public_ip_address = true
  tags = {
    Name = "wordpress-ec2"
  }
  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    yum install -y php php-mysqlnd
    amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2
    wget http://wordpress.org/latest.tar.gz
    tar -xzf latest.tar.gz
    rsync -avP wordpress/ /var/www/html/
    chown -R apache:apache /var/www/html/
    systemctl restart httpd
  EOF
}
