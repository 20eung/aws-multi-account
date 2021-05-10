resource "aws_vpc" "ko-vpc" {
  provider			= aws.main

  cidr_block			= var.ko-vpc-cidr

  tags = merge(
    {	"Name" 		= "${var.user}-ko-vpc"
    },	var.ko-tags
  )
}

resource "aws_vpc" "us-vpc" {
  provider			= aws.sub

  cidr_block			= var.us-vpc-cidr

  tags = merge(
    {	"Name" 		= "${var.user}-us-vpc"
    },	var.us-tags
  )
}
