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
