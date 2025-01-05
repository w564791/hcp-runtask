terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
    }
  }
  backend "remote" {
    
    organization = "terraform"  

    workspaces {
      name = "aws"
    }
  }
  required_version = ">= 1.2.0"
}


provider "aws" {
  region = "ap-northeast-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

