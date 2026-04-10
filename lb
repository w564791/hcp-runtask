resource "aws_lb" "test" {
  name = "test"
  access_logs {
    bucket  = "test-bucket"
    enabled = "true"
  }

  dns_record_client_routing_policy = "any_availability_zone"
  enable_cross_zone_load_balancing = "false"
  enable_deletion_protection       = "true"
  internal                         = false
  ip_address_type                  = "ipv4"
  load_balancer_type               = "network"

  security_groups = ["sg-abcd"]
  subnet_mapping {
    subnet_id = "subnet-cced"
  }

  tags = {
    business-line        = "ops"
    managed-by-terraform = "true"
  }
}