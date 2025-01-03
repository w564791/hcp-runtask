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

  prefix_list_id = "pl-xxxx"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}

resource "aws_vpc_security_group_ingress_rule" "none-tag" {
  security_group_id = aws_security_group.example.id

  prefix_list_id = "pl-xxxx008"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}

resource "aws_vpc_security_group_egress_rule" "none-to-all" {
  security_group_id = aws_security_group.example.id

  prefix_list_id = "pl-abc"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}


resource "aws_vpc_security_group_ingress_rule" "allow-all" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4 = "172.28.0.11/32"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}


resource "aws_vpc_security_group_ingress_rule" "prefix-xxx" {
  security_group_id = aws_security_group.example.id

  prefix_list_id = "pl-xxx"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}

resource "aws_vpc_security_group_ingress_rule" "no-tags" {
  security_group_id = aws_security_group.example.id

  prefix_list_id = "pl-xxx"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}
resource "aws_vpc_security_group_ingress_rule" "no-tags-name" {
  security_group_id = aws_security_group.example.id

  prefix_list_id = "pl-xxx"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
tags = {
     Name = "example"
  }
}