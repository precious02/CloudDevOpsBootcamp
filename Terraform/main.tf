terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "Precious-fernwood"
}

resource "aws_instance" "terraform_instance" {
  ami           = "ami-0b6d9d3d33ba97d99"
  instance_type = "t2.micro"

  tags = {
    Name = "Precious-fernwood-terraform-instance"
    aws-apn-id = "pc:biytoe4tqjehdsa25lc534ba2"
  }
}

output "instance_id" {
  value = aws_instance.terraform_instance.id
}
