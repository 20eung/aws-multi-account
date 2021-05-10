resource "aws_instance" "ko-vm1" {
  provider			= aws.main

  ami 				= "${data.aws_ami.ubuntu-18_04.id}"
  instance_type 		= "t2.micro"
  key_name 			= var.key_pair

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get install iperf3 -y
    EOF

  network_interface {
        network_interface_id	= aws_network_interface.ko-nic1.id
        device_index		= 0
  }

  tags = merge (
    {	Name			= var.ko-vm1
    },	var.ko-tags
  )
}

resource "aws_instance" "us-vm1" {
  provider			= aws.sub

  ami 				= "${data.aws_ami.ubuntu-18_04.id}"
  instance_type 		= "t2.micro"
  key_name 			= var.key_pair

  user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get install iperf3 -y
    EOF

  network_interface {
        network_interface_id	= aws_network_interface.us-nic1.id
        device_index		= 0
  }

  tags = merge (
    {	Name			= var.us-vm1
    },	var.us-tags
  )
}

data "aws_ami" "ubuntu-18_04" {
  most_recent			= true
  owners			= ["${var.ubuntu_account_number}"]

  filter {
	name			= "name"
	values			= ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}

variable "ubuntu_account_number" {
  default			= "099720109477"
}
