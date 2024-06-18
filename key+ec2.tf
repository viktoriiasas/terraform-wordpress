resource "aws_instance" "example" {
  ami           = "ami-0eaf7c3456e7b5b68" 
  instance_type = "t2.micro"
  key_name      = aws_key_pair.ssh_key.key_name
}