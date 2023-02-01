provider "aws" {
  region = "ap-northeast-1"
}

resource "aws_instance" "ec2_private" {
  ami = "ami-0e2bf1ada70fd3f33"
  instance_type = "t2.micro"
  key_name = "ssh-key"
  security_groups = ["sg-096b5e089c243bf8a"]
  subnet_id = "subnet-0b6658a9d6727bb31"
  associate_public_ip_address = false
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    "Name" = "TERRAFORM"
  }
}
