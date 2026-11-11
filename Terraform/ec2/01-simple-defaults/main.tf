terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "terrafform-ec2" {
  ami               = "ami-09bf9dfeeb1e9adbc"
  count             = 1
  availability_zone = "us-east-1c"
  instance_type     = "t2.micro"

  tags = {
    env = "TF-Demo"
  }
}
