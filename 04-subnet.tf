resource "aws_subnet" "ko-snet1" {
  provider                      = aws.main

  vpc_id			= aws_vpc.ko-vpc.id
  cidr_block			= var.ko-snet1-cidr
  map_public_ip_on_launch	= true
  availability_zone		= var.ko-snet1-az_zone

  tags = merge(
    {	"Name"		= "${var.user}-ko-snet1"
    },	var.ko-tags
  )
}

resource "aws_subnet" "us-snet1" {
  provider                      = aws.sub

  vpc_id			= aws_vpc.us-vpc.id
  cidr_block			= var.us-snet1-cidr
  map_public_ip_on_launch	= true
  availability_zone		= var.us-snet1-az_zone

  tags = merge(
    {	"Name"		= "${var.user}-us-snet1"
    },	var.us-tags
  )
}
