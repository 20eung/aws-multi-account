resource "aws_customer_gateway" "onprem-vpn" {
  provider              = aws.sub

  bgp_asn    		= 65000
  ip_address 		= "49.50.63.182"
  device_name		= "us-onprem-vpn"
  type       		= "ipsec.1"

  tags 	= merge (
    {   Name 		= "us-onprem-vpn"
    },  var.us-tags
  )
}

resource "aws_vpn_connection" "onprem-vpn-attach" {
  provider              = aws.sub

  customer_gateway_id 	= aws_customer_gateway.onprem-vpn.id
  transit_gateway_id  	= aws_ec2_transit_gateway.us-tgw.id
  type                	= aws_customer_gateway.onprem-vpn.type
  static_routes_only	= "true"
  enable_acceleration	= "false"

  tags 	= merge (
    {   Name 		= "onprem-vpn--attach"
    },  var.us-tags
  )

  tunnel1_inside_cidr	= "169.254.128.0/30"
  tunnel2_inside_cidr	= "169.254.129.4/30"
  tunnel1_preshared_key	= "sknetvpn"
  tunnel2_preshared_key	= "sknetvpn"
  tunnel1_dpd_timeout_action 	= "clear"
  tunnel2_dpd_timeout_action 	= "clear"
  tunnel1_dpd_timeout_seconds	= "30"
  tunnel2_dpd_timeout_seconds	= "30"
  tunnel1_ike_versions		= ["ikev1"]
  tunnel2_ike_versions		= ["ikev1"]
  tunnel1_phase1_dh_group_numbers 	= ["2"]
  tunnel2_phase1_dh_group_numbers 	= ["2"]
  tunnel1_phase1_encryption_algorithms 	= ["AES128"]
  tunnel2_phase1_encryption_algorithms 	= ["AES128"]
  tunnel1_phase1_integrity_algorithms 	= ["SHA1"]
  tunnel2_phase1_integrity_algorithms 	= ["SHA1"]
  tunnel1_phase1_lifetime_seconds	= "28800"
  tunnel2_phase1_lifetime_seconds	= "28800"
  tunnel1_phase2_dh_group_numbers	= ["2"]
  tunnel2_phase2_dh_group_numbers	= ["2"]
  tunnel1_phase2_encryption_algorithms 	= ["AES128"]
  tunnel2_phase2_encryption_algorithms 	= ["AES128"]
  tunnel1_phase2_integrity_algorithms	= ["SHA1"]
  tunnel2_phase2_integrity_algorithms	= ["SHA1"]
  tunnel1_phase2_lifetime_seconds	= "3600"
  tunnel2_phase2_lifetime_seconds	= "3600"
  tunnel1_rekey_fuzz_percentage		= "100"
  tunnel2_rekey_fuzz_percentage		= "100"
  tunnel1_rekey_margin_time_seconds 	= "540"
  tunnel2_rekey_margin_time_seconds 	= "540"
  tunnel1_replay_window_size 		= "1024"
  tunnel2_replay_window_size 		= "1024"
  tunnel1_startup_action 		= "add"
  tunnel2_startup_action 		= "add"
}

data "aws_ec2_transit_gateway_vpn_attachment" "onprem-vpn-attach" {
  provider              = aws.sub

  transit_gateway_id	= aws_ec2_transit_gateway.us-tgw.id
  vpn_connection_id	= aws_vpn_connection.onprem-vpn-attach.id

  depends_on		= [aws_vpn_connection.onprem-vpn-attach]

  filter {
	name	= "resource-type"
	values	= ["vpn"]
  }
}

resource "aws_ec2_transit_gateway_route" "onprem-vpn-route" {
  provider              = aws.sub

  destination_cidr_block        = var.us-vpn-cidr
  transit_gateway_attachment_id = data.aws_ec2_transit_gateway_vpn_attachment.onprem-vpn-attach.id
  transit_gateway_route_table_id= aws_ec2_transit_gateway.us-tgw.association_default_route_table_id

  depends_on		= [aws_vpn_connection.onprem-vpn-attach]
}

/*
output "onprem_vpn_attach_id" {
  value = data.aws_ec2_transit_gateway_vpn_attachment.onprem-vpn-attach.id
}
*/
