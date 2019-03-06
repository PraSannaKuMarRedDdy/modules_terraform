provider "aws" {
    region = "ap-south-1"
}

module "vpc" {
  source = "../modules/vpc"
  vpc_cidr = "10.0.0.0/23"
  tenancy = "default"
  vpc_id  = "${module.vpc.vpc_id}"
  subnet_cidr1 = "10.0.0.0/25"
  subnet_cidr2 = "10.0.0.128/25"
}

module "instance" {
  source = "../modules/ec2"
  source = "../modules/vpc"
  ec2_count = 1
  ami_id = "ami-0937dcc711d38ef3f"
  instance_type = "t2.micro"
  vpc_id  = "${module.vpc.vpc_id}"
  subnet_id = "${module.vpc.subnet_cidr1}"
}
