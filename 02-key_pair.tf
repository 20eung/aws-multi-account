resource "aws_key_pair" "key_pair-ko" {
  provider	= aws.main

  key_name	= "ko-${var.key_pair}"
  public_key	= file("~/.ssh/id_rsa.pub")
}
  
resource "aws_key_pair" "key_pair-us" {
  provider	= aws.sub

  key_name	= "us-${var.key_pair}"
  public_key	= file("~/.ssh/id_rsa.pub")
}
  
