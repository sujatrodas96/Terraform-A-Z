terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.62"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}


// count logic to create multiple instances
resource "aws_instance" "example" {
  count         = 2
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "Dev-instance-${count.index + 1}"
  }
}
