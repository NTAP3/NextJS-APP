variable "aws_access_key" {
  description = "The AWS access key to use for authentication."
  default = "AKIAYYZLZXIX3NB43DFD"
}

variable "aws_secret_key" {
  description = "The AWS secret key to use for authentication."
  defautl = "AJHucPZPLWhf9JmztMngtBO0aUESziqq6HRhLLlO"
}

variable "region" {
  description = "The AWS region in which to create resources."
  default = "eu-central-1"
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instance."
  default = "t2.micro"
}

variable "ami" {
  description = "The ID of the AMI to use for the EC2 instance."
  default = "ami-0d1ddd83282187d18"
}

variable "subnet_id" {
  description = "The ID of the subnet in which to launch the EC2 instance."
  default = "subnet-0336626777137f392"
}

variable "security_group_ids" {
  description = "The IDs of the security groups to associate with the EC2 instance."
  type = list(string)
}

variable "ec2_key_name" {
  description = "The name of the EC2 key pair to use for SSH access."
  default = "task3"
}

variable "docker_image" {
  description = "The full name of the Docker image to deploy."
  default = "602997897775.dkr.ecr.eu-central-1.amazonaws.com/nextjs:140"
}

variable "elastic_ip_allocation_id" {
    description = "The Elastic IP for your EC2 instance"
    type = string
    default = "eipalloc-079741a994fef2264"
}