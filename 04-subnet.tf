resource "aws_subnet" "ko-snet1" {
  provider                      = aws.testbed

  vpc_id			= aws_vpc.ko-vpc.id
  cidr_block			= var.ko-snet1-cidr
  map_public_ip_on_launch	= true
  availability_zone		= "ap-northeast-2a"

  tags = merge(
    {	"Name"		= "${var.user}-ko-snet1"
    },	var.ko-tags
  )
}

resource "aws_subnet" "us-snet1" {
  provider                      = aws.sknet
  vpc_id			= aws_vpc.us-vpc.id
  cidr_block			= var.us-snet1-cidr
  map_public_ip_on_launch	= true
  availability_zone		= "us-east-1a"

  tags = merge(
    {	"Name"		= "${var.user}-us-snet1"
    },	var.us-tags
  )
}
