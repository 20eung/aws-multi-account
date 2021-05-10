resource "aws_default_security_group" "default-ko-nsg" {
  provider			= aws.main

  vpc_id			= aws_vpc.ko-vpc.id

  egress {
	from_port   = 0
	to_port     = 0
	protocol    = "-1"
	cidr_blocks = ["0.0.0.0/0"]
  }

  tags		= merge (
    {	Name	= var.ko-nsg
    }, 	var.ko-tags
  )
}

resource "aws_security_group_rule" "Allow-ssh-us_vpc-to_ko_vpc" {
  provider			= aws.main

  type		= "ingress"
  from_port	= 22
  to_port	= 22
  protocol	= "tcp"
  cidr_blocks	= [var.us-vpc-cidr]
  description   = "Allow-ssh-us_vpc"
  security_group_id	= aws_default_security_group.default-ko-nsg.id

  lifecycle { 
	create_before_destroy = true 
  }
}

resource "aws_security_group_rule" "Allow-ssh-us_vpn-to_ko_vpc" {
  provider			= aws.main

  type		= "ingress"
  from_port	= 22
  to_port	= 22
  protocol	= "tcp"
  cidr_blocks	= [var.us-vpn-cidr]
  description   = "Allow-ssh-us_vpn"
  security_group_id	= aws_default_security_group.default-ko-nsg.id

  lifecycle {
	create_before_destroy = true 
  }
}

resource "aws_security_group_rule" "Allow-ssh-az_vdi-to_ko_vpc" {
  provider			= aws.main

  type		= "ingress"
  from_port	= 22
  to_port	= 22
  protocol	= "tcp"
  cidr_blocks	= [var.vdi-cidr]
  description   = "Allow-ssh-az_vdi"
  security_group_id	= aws_default_security_group.default-ko-nsg.id

  lifecycle {
	create_before_destroy = true 
  }
}

resource "aws_security_group_rule" "Allow-icmp-us_vpc-to_ko_vpc" {
  provider			= aws.main

  type		= "ingress"
  from_port	= -1
  to_port	= -1
  protocol	= "icmp"
  cidr_blocks	= [var.us-vpc-cidr]
  description   = "Allow-icmp-us_vpc"
  security_group_id	= aws_default_security_group.default-ko-nsg.id

  lifecycle { 
	create_before_destroy = true 
  }
}

resource "aws_security_group_rule" "Allow-icmp-us_vpn-to_ko_vpc" {
  provider			= aws.main

  type		= "ingress"
  from_port	= -1
  to_port	= -1
  protocol	= "icmp"
  cidr_blocks	= [var.us-vpn-cidr]
  description   = "Allow-icmp-us_vpn"
  security_group_id	= aws_default_security_group.default-ko-nsg.id

  lifecycle { 
	create_before_destroy = true 
  }
}

resource "aws_security_group_rule" "Allow-icmp-az_vdi-to_ko_vpc" {
  provider			= aws.main

  type		= "ingress"
  from_port	= -1
  to_port	= -1
  protocol	= "icmp"
  cidr_blocks	= [var.vdi-cidr]
  description   = "Allow-icmp-az_vdi"
  security_group_id	= aws_default_security_group.default-ko-nsg.id

  lifecycle { 
	create_before_destroy = true 
  }
}

resource "aws_default_security_group" "default-us-nsg" {
  provider			= aws.sub

  vpc_id			= aws_vpc.us-vpc.id

  egress {
	from_port   = 0
	to_port     = 0
	protocol    = "-1"
	cidr_blocks = ["0.0.0.0/0"]
  }

  tags		= merge (
    {	Name	= var.us-nsg
    }, 	var.us-tags
  )
}

resource "aws_security_group_rule" "Allow-ssh-ko_vpc_to_us_vpc" {
  provider			= aws.sub

  type		= "ingress"
  from_port	= 22
  to_port	= 22
  protocol	= "tcp"
  cidr_blocks	= [var.ko-vpc-cidr]
  description   = "Allow-ssh-ko_vpc"
  security_group_id	= aws_default_security_group.default-us-nsg.id

  lifecycle { 
	create_before_destroy = true 
  }
}

resource "aws_security_group_rule" "Allow-ssh-us_vpn_to_us_vpc" {
  provider			= aws.sub

  type          = "ingress"
  from_port     = 22
  to_port       = 22
  protocol      = "tcp"
  cidr_blocks   = [var.us-vpn-cidr]
  description   = "Allow-ssh-us_vpn"
  security_group_id     = aws_default_security_group.default-us-nsg.id

  lifecycle {
        create_before_destroy = true
  }
}

resource "aws_security_group_rule" "Allow-ssh-az_vdi_to_us_vpc" {
  provider			= aws.sub

  type		= "ingress"
  from_port	= 22
  to_port	= 22
  protocol	= "tcp"
  cidr_blocks	= [var.vdi-cidr]
  description   = "Allow-ssh-az_vdi"
  security_group_id	= aws_default_security_group.default-us-nsg.id

  lifecycle {
	create_before_destroy = true 
  }
}

resource "aws_security_group_rule" "Allow-icmp-ko_vpc_to_us_vpc" {
  provider			= aws.sub

  type		= "ingress"
  from_port	= -1
  to_port	= -1
  protocol	= "icmp"
  cidr_blocks	= [var.ko-vpc-cidr]
  description   = "Allow-icmp-ko_vpc"
  security_group_id	= aws_default_security_group.default-us-nsg.id

  lifecycle { 
	create_before_destroy = true 
  }
}

resource "aws_security_group_rule" "Allow-icmp-us_vpn_to_us_vpc" {
  provider			= aws.sub

  type          = "ingress"
  from_port     = -1
  to_port       = -1
  protocol      = "icmp"
  cidr_blocks   = [var.us-vpn-cidr]
  description   = "Allow-icmp-us_vpn"
  security_group_id     = aws_default_security_group.default-us-nsg.id

  lifecycle {
        create_before_destroy = true
  }
}

resource "aws_security_group_rule" "Allow-icmp-az_vdi_to_us_vpc" {
  provider			= aws.sub

  type		= "ingress"
  from_port	= -1
  to_port	= -1
  protocol	= "icmp"
  cidr_blocks	= [var.vdi-cidr]
  description   = "Allow-icmp-az_vdi"
  security_group_id	= aws_default_security_group.default-us-nsg.id

  lifecycle { 
	create_before_destroy = true 
  }
}

