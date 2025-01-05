resource "aws_instance" "web" {
  ami           = "ami-acd"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}