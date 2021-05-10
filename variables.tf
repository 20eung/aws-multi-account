variable "role_arn" {
  type          = string
  description   = "Testbed role_arn"
}

variable "key_pair" {
  default		= "i-sk-com.pem"
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
	Creator         = "sknet"
	GlobalWAN       = "US-EAST"
  }
}

variable "ko-vpc" {
  default		= "testbed-ko-vpc"
}

variable "us-vpc" {
  default		= "sknet-us-vpc"
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
  default		= "testbed-ko-nsg"
}

variable "us-nsg" {
  default		= "sknet-us-nsg"
}

variable "ko-igw" {
  default		= "testbed-ko-igw"
}

variable "us-igw" {
  default		= "sknet-us-igw"
}

variable "ko-nic1" {
  default		= "testbed-ko-nic1"
}

variable "ko-nic1-ip" {
  default		= "10.239.224.10"
}

variable "ko-vm1" {
  default		= "testbed-ko-vm1"
}

variable "us-nic1" {
  default		= "sknet-us-nic1"
}

variable "us-nic1-ip" {
  default		= "10.238.128.10"
}

variable "us-vm1" {
  default		= "sknet-us-vm1"
}

variable "ko-rtb" {
  default		= "testbed-ko-rtb"
}

variable "us-rtb" {
  default		= "sknet-us-rtb"
}

variable "ko-tgw" {
  default		= "testbed-ko-tgw"
}

variable "us-tgw" {
  default		= "sknet-us-tgw"
}

variable "ko-tgw-rtb" {
  default		= "testbed-ko-tgw-rtb"
}

variable "us-tgw-rtb" {
  default		= "sknet-us-tgw-rtb"
}

variable "testbed-ko-cidr" {
  default       	= "10.239.224.0/24"
}

variable "vpn-ko-cidr" {
  default       	= "10.100.100.1/32"
}

variable "sknet-us-cidr" {
  default       	= "10.238.128.0/24"
}

variable "sknetvdi-cidr" {
  default		= "52.231.155.78/32"
}

