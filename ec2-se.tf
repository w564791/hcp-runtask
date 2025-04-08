resource "aws_instance" "se" {
  count = 1
  ami           = "ami-acd"
  instance_type = "t3.micro"
  associate_public_ip_address = false
  metadata_options {
    http_tokens = "required"
    http_endpoint = "enabled"
  }
  root_block_device {
    encrypted  = true
  }
  ebs_block_device {
    
  }
  volume_tags =  {

    managed-by = "abc"
    business-line = "cde"
    component = "mid"
    backup-enabled = "acc"
    eee = "ffc"
    owner = "abcd"
  }
  tags = {
    managed-by = "abc"
    business-line = "cde"
    component = "mid"
    backup-enabled = "acc"
    eee = "ffc"
    owner = "abcd"
    cluster-name = "a"
    service-name = "ddv"
  }
}