terraform {
  required_version = ">= 0.12, < 0.13"
}

provider "aws" {
  region = "ap-southeast-2"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

# AWS AMI with www
resource "aws_instance" "app" {
  availability_zone = "ap-southeast-2a"
  ami           = "ami-05f9e52e22acaa84d"
  instance_type = "t2.micro"
  key_name       = "awskey1"

  user_data = <<-EOF
              #!/bin/bash
              sudo service apache2 start
              EOF
}

