



resource "aws_vpc_security_group_ingress_rule" "allow-all" {
  security_group_id = "sg-abcd"

  cidr_ipv4 = "172.28.0.11/32"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}
