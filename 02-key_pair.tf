resource "aws_key_pair" "key_pair-ko" {
  provider	= aws.main

  key_name	= "ko-${var.user}.pem"
  public_key	= file("~/.ssh/id_rsa.pub")
}
  
resource "aws_key_pair" "key_pair-us" {
  provider	= aws.sub

  key_name	= "us-${var.user}.pem"
  public_key	= file("~/.ssh/id_rsa.pub")
}
  
