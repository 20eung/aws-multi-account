resource "aws_default_route_table" "default-ko-rtb" {
  provider			= aws.main

  default_route_table_id	= aws_vpc.ko-vpc.default_route_table_id

  route {
        cidr_block              = var.us-vpc-cidr
        transit_gateway_id      = aws_ec2_transit_gateway.ko-tgw.id
  }

  route {
        cidr_block              = var.us-vpn-cidr
        transit_gateway_id      = aws_ec2_transit_gateway.ko-tgw.id
  }

  route {
        cidr_block              = "0.0.0.0/0"
        gateway_id              = aws_internet_gateway.ko-igw.id
  }

  tags = merge (
    {   Name                    = var.ko-rtb
    },	var.ko-tags
  )
}

resource "aws_route_table_association" "default-ko-snet1" {
  provider			= aws.main

  subnet_id			= aws_subnet.ko-snet1.id
  route_table_id		= aws_vpc.ko-vpc.default_route_table_id
}

resource "aws_default_route_table" "default-us-rtb" {
  provider			= aws.sub

  default_route_table_id	= aws_vpc.us-vpc.default_route_table_id

  route {
        cidr_block              = var.ko-vpc-cidr
        transit_gateway_id      = aws_ec2_transit_gateway.us-tgw.id
  }

  route {
        cidr_block              = var.us-vpn-cidr
        transit_gateway_id      = aws_ec2_transit_gateway.us-tgw.id
  }

  route {
        cidr_block              = "0.0.0.0/0"
        gateway_id              = aws_internet_gateway.us-igw.id
  }

  tags = merge (
    {   Name                    = var.us-rtb
    },	var.us-tags
  )
}

resource "aws_route_table_association" "default-us-snet1" {
  provider			= aws.sub

  subnet_id			= aws_subnet.us-snet1.id
  route_table_id		= aws_vpc.us-vpc.default_route_table_id
}

