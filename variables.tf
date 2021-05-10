variable "role_arn" {
  type          = string
  description   = "Testbed role_arn"
}

variable "key_pair" {
  default		= "dc04258.pem"
}

variable "user" {
  default       	= "dc04258"
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

variable "ko-vpc" {
  default		= "ko-vpc"
}

variable "us-vpc" {
  default		= "us-vpc"
}

variable "ko-vpc-cidr" {
  default       	= "10.239.224.0/24"
}

variable "ko-snet1-cidr" {
  default		= "10.239.224.0/26"
}

variable "us-vpc-cidr" {
  default       	= "10.238.128.0/24"
}

variable "us-snet1-cidr" {
  default		= "10.238.128.0/26"
}

### 미사용 변수

variable "ko-region" {
  default		= "ap-northeast-2"
}

variable "us-region" {
  default		= "us-east-1"
}

variable "ko-nsg" {
  default		= "ko-nsg"
}

variable "us-nsg" {
  default		= "us-nsg"
}

variable "ko-igw" {
  default		= "ko-igw"
}

variable "us-igw" {
  default		= "us-igw"
}

variable "ko-nic1" {
  default		= "ko-nic1"
}

variable "ko-nic1-ip" {
  default		= "10.239.224.10"
}

variable "ko-vm1" {
  default		= "ko-vm1"
}

variable "us-nic1" {
  default		= "us-nic1"
}

variable "us-nic1-ip" {
  default		= "10.238.128.10"
}

variable "us-vm1" {
  default		= "us-vm1"
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

variable "ko-tgw-rtb" {
  default		= "ko-tgw-rtb"
}

variable "us-tgw-rtb" {
  default		= "us-tgw-rtb"
}

variable "us-vpn-cidr" {
  default       	= "10.100.100.1/32"
}

variable "vdi-cidr" {
  default		= "52.231.155.78/32"
}

