resource "aws_security_group" "example" {
  name        = "example"
  description = "example"
  vpc_id      = var.vpc_id
  tags = {
    Name = "example"
    managed-by = "abc"
    business-line = "cde"
    eee = "ffc"
    owner = "abcd"
  }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "-1"
    cidr_blocks      = ["10.0.0.3/32","10.0.0.11/32","8.8.8.8/32"]
  }
  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "-1"
    prefix_list_ids = ["pl-aaa0009","pl-aaa0008","pl-xxxx000"]
    cidr_blocks      = ["10.0.0.3/32","10.0.0.0/8","11.1.0.3/32","10.2.0.5/32"]
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

  prefix_list_id = "pl-xxxx000"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
     xxx = "aac"
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

  prefix_list_id = "pl-xxx0003"
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

resource "aws_vpc_security_group_ingress_rule" "allow-101" {
  security_group_id = aws_security_group.example.id

  cidr_ipv4 = "10.18.0.11/32"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}
resource "aws_vpc_security_group_ingress_rule" "prefix-xxx" {
  security_group_id = aws_security_group.example.id

  prefix_list_id = "pl-xxx0003"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}

resource "aws_vpc_security_group_ingress_rule" "no-tags" {
  security_group_id = aws_security_group.example.id

  prefix_list_id = "pl-xxx0003"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  tags = {
     Name = "example"
  }
}
resource "aws_vpc_security_group_ingress_rule" "no-tags-name" {
  security_group_id = aws_security_group.example.id

  prefix_list_id = "pl-xxx0003"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
tags = {
     Name = "example"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sggggg" {
  security_group_id = aws_security_group.example.id
  referenced_security_group_id = "sg-666c"
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
tags = {
     Name = "example"
  }
}

resource "aws_security_group" "example-ff" {
  name        = "example"
  description = "example"
  vpc_id      = var.vpc_id
  tags = {
    Name = "example"
    managed-by = "abc"
    eee = "ffc"
    owner = "abcd"
    business-line = "bbc"
  }

}