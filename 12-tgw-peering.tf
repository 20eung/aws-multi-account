resource "aws_ec2_transit_gateway_peering_attachment" "us-tgw-peering" {
  provider		  = aws.main

  peer_account_id         = var.account_id_sub
  peer_region             = var.us_tgw_region
  peer_transit_gateway_id = var.us_tgw_id
  transit_gateway_id      = aws_ec2_transit_gateway.ko-tgw.id

  tags = merge (
    {	Name = "us-tgw--peering"
    },	var.ko-tags
  )
}

resource "aws_ec2_transit_gateway_route" "us-tgw-route" {
  provider		  	= aws.main

  destination_cidr_block	= var.us-vpc-cidr
  transit_gateway_attachment_id	= aws_ec2_transit_gateway_peering_attachment.us-tgw-peering.id
  transit_gateway_route_table_id= aws_ec2_transit_gateway.ko-tgw.association_default_route_table_id
}

resource "aws_ec2_transit_gateway_route" "us-vpn-route" {
  provider		  	= aws.main

  destination_cidr_block        = var.us-vpn-cidr
  transit_gateway_attachment_id = aws_ec2_transit_gateway_peering_attachment.us-tgw-peering.id
  transit_gateway_route_table_id= aws_ec2_transit_gateway.ko-tgw.association_default_route_table_id
}

resource "aws_ec2_transit_gateway_peering_attachment_accepter" "ko-tgw-peering" {
  provider		  	= aws.sub

  transit_gateway_attachment_id	= var.us_tgw_peering_attachment_id

  tags = merge (
    {	Name = "ko-tgw--attach"
    },	var.us-tags
  )
}

resource "aws_ec2_transit_gateway_route" "ko-tgw-route" {
  provider		  	= aws.sub

  destination_cidr_block	= var.ko-vpc-cidr
  transit_gateway_attachment_id	= aws_ec2_transit_gateway_peering_attachment_accepter.ko-tgw-peering.id
  transit_gateway_route_table_id= aws_ec2_transit_gateway.us-tgw.association_default_route_table_id
}

output "us_tgw_peering_attachment_id" {
  provider		  	= aws.main

  value	= aws_ec2_transit_gateway_peering_attachment.us-tgw-peering.id
}

output "us-tgw-rtb" {
  value 	= aws_ec2_transit_gateway.us-tgw.association_default_route_table_id
}

