variable "role_arn" {
  type          = string
  description   = "Testbed role_arn"
}

variable "user" {
  default       	= "dc04258"
}

variable "ko-vpc-cidr" {
  default       	= "10.239.224.0/24"
}

variable "us-vpc-cidr" {
  default       	= "10.238.128.0/24"
}

variable "ko-snet1-cidr" {
  default		= "10.239.224.0/26"
}

variable "ko-snet1-az_zone" {
  default		= "ap-northeast-2a"
}

variable "us-snet1-cidr" {
  default		= "10.238.128.0/26"
}

variable "us-snet1-az_zone" {
  default		= "us-east-1a"
}

variable "ko-nsg" {
  default		= "ko-nsg"
}

variable "us-nsg" {
  default		= "us-nsg"
}

variable "vdi-cidr" {
  default		= "52.231.155.78/32"
}

variable "us-vpn-cidr" {
  default       	= "10.100.100.1/32"
}

variable "ko-nic1" {
  default		= "ko-nic1"
}

variable "ko-nic1-ip" {
  default		= "10.239.224.10"
}

variable "us-nic1" {
  default		= "us-nic1"
}

variable "us-nic1-ip" {
  default		= "10.238.128.10"
}

variable "ko-vm1" {
  default		= "ko-vm1"
}

variable "us-vm1" {
  default		= "us-vm1"
}

variable "ko-igw" {
  default		= "ko-igw"
}

variable "us-igw" {
  default		= "us-igw"
}

variable "ko-rtb" {
  default		= "ko-rtb"
}

variable "us-rtb" {
  default		= "us-rtb"
}

variable "ko-tgw" {
  default		= "ko-tgw"
}

variable "us-tgw" {
  default		= "us-tgw"
}

variable "us-region" {
  default		= "us-east-1"
}

variable "ko-tags" {
  default = {
	Creator         = "dc04258"
	GlobalWAN       = "AP-KOREA"
  }
}

variable "us-tags" {
  default = {
	Creator         = "dc04258"
	GlobalWAN       = "US-EAST"
  }
}
