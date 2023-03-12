provider "aws" {
  region = var.region
}

resource "aws_eip" "this" {
  instance = aws_instance.this.id
  allocation_id = var.elastic_ip_allocation_id
}

resource "aws_instance" "this" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  security_groups = [aws_security_group.allow_ssh.name]
  subnet_id     = var.subnet_id
  associate_public_ip_address = true
  user_data     = base64encode(local.user_data)
  
  tags = {
    Name = "Deploy"
  }
}

resource "aws_security_group" "allow_ssh" {
  name_prefix = "allow_ssh"
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

locals {
  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get -y install docker.io
              sudo docker run -p 80:80 ${var.docker_image}
              EOF
}
