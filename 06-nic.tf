resource "aws_network_interface" "ko-nic1" {
  provider			= aws.main

  subnet_id			= aws_subnet.ko-snet1.id
  private_ips			= [var.ko-nic1-ip]
  security_groups		= [aws_default_security_group.default-ko-nsg.id]
  description			= "ko-vm1-nic"

  tags = merge (
    {   Name			= var.ko-nic1
    },  var.ko-tags
  )
}

resource "aws_network_interface" "us-nic1" {
  provider			= aws.sub

  subnet_id			= aws_subnet.us-snet1.id
  private_ips			= [var.us-nic1-ip]
  security_groups		= [aws_default_security_group.default-us-nsg.id]
  description			= "us-vm1-nic"

  tags = merge (
    {   Name			= var.us-nic1
    },  var.us-tags
  )
}

