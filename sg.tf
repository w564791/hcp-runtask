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