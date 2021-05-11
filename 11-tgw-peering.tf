resource "aws_ec2_transit_gateway_peering_attachment" "us-tgw-peering" {
  provider		  = aws.main

  peer_account_id         = aws_ec2_transit_gateway.us-tgw.owner_id
  peer_region             = var.us-region
  peer_transit_gateway_id = aws_ec2_transit_gateway.us-tgw.id
  transit_gateway_id      = aws_ec2_transit_gateway.ko-tgw.id

  tags = merge (
    {	Name = "us-tgw--peering"
    },	var.ko-tags
  )
}

resource "time_sleep" "wait_7_minutes_ko-tgw" {
  depends_on			= [aws_ec2_transit_gateway_peering_attachment.us-tgw-peering]
  create_duration		= "7m"
}
  
resource "aws_ec2_transit_gateway_route" "us-vpc-route" {
  provider		  	= aws.main

  destination_cidr_block	= var.us-vpc-cidr
  transit_gateway_attachment_id	= aws_ec2_transit_gateway_peering_attachment.us-tgw-peering.id
  transit_gateway_route_table_id= aws_ec2_transit_gateway.ko-tgw.association_default_route_table_id

  depends_on			= [time_sleep.wait_7_minutes_ko-tgw]
}

resource "aws_ec2_transit_gateway_route" "us-vpn-route" {
  provider		  	= aws.main

  destination_cidr_block        = var.us-vpn-cidr
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.us-tgw-peering.id
  transit_gateway_route_table_id= aws_ec2_transit_gateway.ko-tgw.association_default_route_table_id

  depends_on			= [time_sleep.wait_7_minutes_ko-tgw]
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "ko-tgw-peering" {
  provider		  	= aws.sub

  transit_gateway_attachment_id	= aws_ec2_transit_gateway_peering_attachment.us-tgw-peering.id

  tags = merge (
    {	Name = "ko-tgw--attach"
    },	var.us-tags
  )
}

resource "time_sleep" "wait_7_minutes_us-tgw" {
  depends_on			= [aws_ec2_transit_gateway_peering_attachment_accepter.ko-tgw-peering]
  create_duration		= "7m"
}
  
resource "aws_ec2_transit_gateway_route" "ko-vpc-route" {
  provider		  	= aws.sub

  destination_cidr_block	= var.ko-vpc-cidr
# transit_gateway_attachment_id	= aws_ec2_transit_gateway_peering_attachment_accepter.ko-tgw-peering.id
  transit_gateway_attachment_id	= aws_ec2_transit_gateway_peering_attachment.us-tgw-peering.id
  transit_gateway_route_table_id= aws_ec2_transit_gateway.us-tgw.association_default_route_table_id


  depends_on			= [time_sleep.wait_7_minutes_us-tgw]
}

