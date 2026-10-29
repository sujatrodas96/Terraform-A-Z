provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "Dev-instance"
  }
}

resource "aws_instance" "example-2" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "Dev-instance-2"
  }
}

resource "aws target_group" "example" {
  name     = "example-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "default"
  depends_on = [aws_instance.example, aws_instance.example-2]
}

resource "aws_lb" "example" {
  name               = "example-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = "default"
  subnets            = ["subnet-12345678", "subnet-87654321"]
  depends_on          = [aws_target_group.example]
}

