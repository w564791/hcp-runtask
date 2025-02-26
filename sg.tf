
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

