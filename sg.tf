resource "aws_security_group" "example" {
  name        = "example"
  description = "example"
  vpc_id      = var.vpc_id
  tags = {
    Name = "example"
  }
}

resource "aws_vpc_security_group_ingress_rule" "example" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4   = "10.0.0.0/8"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}