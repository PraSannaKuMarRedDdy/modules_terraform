variable "vpc_cidr"  {
   default = "10.10.0.0/23"
}

variable "tenancy" {
  default = "dedicated"
}

variable "subnet_cidr1" {
  default = "10.10.1.0/25"
}

variable "subnet_cidr2" {
  default = "10.10.2.0/25"
}

variable "vpc_id" {}
