provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  for_each      = toset(["dev-server", "test-server", "prod-server"])
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  tags = {
    Name = "${each.key}"
  }
}