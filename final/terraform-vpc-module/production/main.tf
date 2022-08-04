provider "aws" {
  region = "ap-south-1"
  access_key = "AKIAQUPGWERV2YC76QUA"
  secret_key = "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"
}

module "my_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source        = "../modules/ec2"
  ec2_count     = 1
  ami_id        = "ami-5a8da735"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"
}
