#create an Instance of Amazon-Linux
resource "aws_instance" "tf-instance" {
    count = "${var.ec2_count}"
    ami  = "${var.ami_id}"
    instance_type = "${var.instance_type}"
    subnet_id = "${var.subnet_id}"
    associate_public_ip_address = "true"
    security_groups = ["${aws_security_group.web-sg.id}"]

    tags {
      Name = "tf-instance"
    }
}
