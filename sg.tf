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

  cidr_ipv4   = "8.8.8.8/32"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}
resource "aws_vpc_security_group_ingress_rule" "prefix" {
  security_group_id = aws_security_group.example.id

  prefix_list_id = "pl-xxxx008"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}



resource "aws_security_group_rule" "rejected" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = ["1.1.1.1/32"]
  security_group_id = aws_security_group.example.id
}