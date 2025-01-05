resource "aws_instance" "web" {
  ami           = "ami-acd"
  instance_type = "t3.micro"
  associate_public_ip_address = false
  metadata_options {
    http_tokens = "required"
    http_endpoint = "enabled"
  }
  tags = {
    Name = "HelloWorld"
  }
}