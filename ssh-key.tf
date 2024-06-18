resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh-key"
  public_key = file("~/.ssh/id_rsa.pub")  # Adjust the path to your public key
}