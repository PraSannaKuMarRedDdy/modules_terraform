// Module specific variables

variable "instance_name" {
  description = "Used to populate the Name tag. This is done in main.tf"
  default = "tf-instance"
}

variable "instance_type" {
  default = "t2.mciro"
}

variable "availability-zones" {
    default = "ap-south-1a,ap-south-1b"
    description = "Availability zones for launching the Vault instances"
}

variable "subnet_id" {
  description = "The VPC subnet the instance(s) will go in"
}

variable "vpc_id" {}

variable "ami_id" {
  description = "The AMI to use"
  default = "ami-0937dcc711d38ef3f"
}

variable "ec2_count" {
  description = "number of instances to make"
  default = 1
}

variable "tags" {
  default = {
    created_by = "terraform"
 }
}

variable "security_groups" {
  type = "list"
}
