resource "aws_security_group" "web-sg" {
    name = "web-sg"
    description = "Allow the acces for SSH and http"
    vpc_id    = "${var.vpc_id}"
    ingress {
    # TLS (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "-1"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = # add a CIDR block here
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
     }

  ingress {
     # TLS (change to whatever ports you need)
     from_port   = 22
     to_port     = 22
     protocol    = "-1"
     # Please restrict your ingress to only necessary IPs and ports.
     # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
     cidr_blocks = # add a CIDR block here
   }

   egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
      }
}

#outputs
output "security_group_id" {
  value = "${aws_security_group.web-sg.id}"
}
