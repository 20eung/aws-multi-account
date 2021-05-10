resource "aws_key_pair" "key_pair-ko" {
  provider	= aws.main

  key_name	= var.key_pair
  public_key	= file("~/.ssh/id_rsa.pub")
}
  
resource "aws_key_pair" "key_pair-us" {
  provider	= aws.sub

  key_name	= var.key_pair
  public_key	= file("~/.ssh/id_rsa.pub")
}
  
