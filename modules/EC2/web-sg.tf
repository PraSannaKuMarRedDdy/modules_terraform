resource "aws_security_group" "web-sg" {
    name = "web-sg-new"
    description = "Allow the acces for SSH and http"
    vpc_id    = "${var.vpc_id}"
    ingress {
    # TLS (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
     # TLS (change to whatever ports you need)
     from_port   = 22
     to_port     = 22
     protocol    = "tcp"
     # Please restrict your ingress to only necessary IPs and ports.
     # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
     cidr_blocks = ["0.0.0.0/0"]
   }

   egress {
     from_port = 0
     to_port = 0
     protocol = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }
}

#outputs
output "security_groups" {
  value = "${aws_security_group.web-sg.id}"
}
