provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "Dev-instance"
  }
  lifecycle {
    create_before_destroy = true
    ignore_changes        = [tags]
    prevent_destroy = true
  }
}