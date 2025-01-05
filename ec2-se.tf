resource "aws_instance" "se" {
  count = 1
  ami           = "ami-acd"
  instance_type = "t3.micro"
  associate_public_ip_address = false
  metadata_options {
    http_tokens = "required"
    http_endpoint = "enabled"
  }
  volume_tags =  {
    Name = "example"
    managed-by = "abc"
    business-line = "cde"
    component = "mid"
    backup-enabled = "acc"
    eee = "ffc"
    owner = "abcd"
  }
  tags = {
    Name = "example"
    managed-by = "abc"
    business-line = "cde"
    component = "mid"
    backup-enabled = "acc"
    eee = "ffc"
    owner = "abcd"
    service-name = "dd"
  }
}