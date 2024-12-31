terraform {
  required_providers {
  }
  backend "remote" {
    
    organization = "terraform"  

    workspaces {
      name = "aws"
    }
  }
  required_version = ">= 1.2.0"
}


resource "null_resource" "null" {

  triggers = {
    cluster_instance_ids = ["a","b","c"]
  }
}