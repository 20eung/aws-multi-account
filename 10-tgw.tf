resource "aws_ec2_transit_gateway" "ko-tgw" {
  provider		= aws.main

  tags = merge (
    {	Name		= "ko-tgw"
    },	var.ko-tags
  )
}

resource "aws_ec2_transit_gateway_vpc_attachment" "ko-vpc-attach" {
  provider		= aws.main

  subnet_ids		= [aws_subnet.ko-snet1.id]
  vpc_id		= aws_vpc.ko-vpc.id
  transit_gateway_id	= aws_ec2_transit_gateway.ko-tgw.id

  tags = merge (
    {	Name		= "${var.ko-vpc}--attach"
    },	var.ko-tags
  )
}

resource "aws_ec2_transit_gateway" "us-tgw" {
  provider		= aws.sub

  tags = merge (
    {	Name		= "us-tgw"
    },	var.us-tags
  )
}

resource "aws_ec2_transit_gateway_vpc_attachment" "us-vpc-attach" {
  provider		= aws.sub

  subnet_ids		= [aws_subnet.us-snet1.id]
  vpc_id		= aws_vpc.us-vpc.id
  transit_gateway_id	= aws_ec2_transit_gateway.us-tgw.id

  tags = merge (
    {	Name		= "${var.us-vpc}--attach"
    },	var.us-tags
  )
}

