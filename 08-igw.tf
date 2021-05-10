resource "aws_internet_gateway" "ko-igw" {
  provider			= aws.main

  vpc_id			= aws_vpc.ko-vpc.id

  tags = merge (
    {   Name                    = var.ko-igw
    },	var.ko-tags
  )
}

resource "aws_internet_gateway" "us-igw" {
  provider			= aws.sub

  vpc_id			= aws_vpc.us-vpc.id

  tags = merge (
    {   Name                    = var.us-igw
    },	var.us-tags
  )
}

