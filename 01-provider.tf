provider "aws" {
  alias		= "main"
  profile	= "testbed"
  region	= "ap-northeast-2"
  shared_credentials_file = "${pathexpand("~/.aws/credentials")}"
}

provider "aws" {
  alias		= "sub"
  profile	= "sknet"
  region	= "us-east-1"
  assume_role {
	role_arn	= var.role_arn
  }
}
