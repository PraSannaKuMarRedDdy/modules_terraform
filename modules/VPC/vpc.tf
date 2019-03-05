#creating the VPC
resource "aws_vpc" "tf-vpc" {
    cidr_block = "${var.vpc_cidr}"
    instance_tenancy = "${var.tenancy}"
    enable_dns_hostnames = "true"

    tags {
      Name = "tf-vpc"
    }
}

#creating the public and private subnets

resource "aws_subnet" "tf-pub-sub1" {
    vpc_id = "${var.vpc_id}"
    cidr_block = "${var.subnet_cidr1}"
    map_public_ip_on_launch = "true"

    tags {
      Name = "tf-pub-sub1"
    }
}

resource "aws_subnet" "tf-pvt-sub2" {
     vpc_id = "${var.vpc_id}"
     cidr_block = "${var.subnet_cidr2}"
     map_public_ip_on_launch = "true"

     tags {
       Name = "tf-pvt-sub2"
     }
}

#creating internet gateway
resource "aws_internet_gateway" "tf-igw" {
    vpc_id = "${var.vpc_id}"

    tags {
      Name = "tf-igw"
    }
}

#creating the route table

resource "aws_route_table" "tf-rt" {
    vpc_id = "${var.vpc_id}"

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.tf-igw.id}"
    }
   tags {
     Name  = "tf-rt"
   }
}

#Route table association to the Public subnets

resource "aws_route_table_association" "rt-association" {
  subnet_id      = "${aws_subnet.tf-pub-sub1.id}"
  route_table_id = "${aws_route_table.tf-rt.id}"
}


#output for the endpoint_id

output "vpc_id" {
  value = "${aws_vpc.tf-vpc.id}"
}

output "subnet_cidr1" {
  value = "${aws_subnet.tf-pub-sub1.id}"
}

output "subnet_cidr2" {
  value = "${aws_subnet.tf-pvt-sub2.id}"
}
