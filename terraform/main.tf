provider "aws" {
  region = var.region
}

resource "aws_eip" "this" {
  instance = aws_instance.this.id
}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = var.security_group_ids
  subnet_id     = var.subnet_id
  associate_public_ip_address = true
  user_data     = base64encode(local.user_data)

  tags = {
    Name = "Deploy"
  }
}

locals {
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get -y install docker.io
              sudo docker run -p 3000:3000 ${var.docker_image}
              EOF
}
