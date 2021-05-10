resource "aws_key_pair" "key_pair" {
  key_name	= var.key_pair
  public_key = file("~/.ssh/i-sk-com-rsa-pub")
}
  
