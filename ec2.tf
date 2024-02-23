locals {
  # The name of the EC2 instance
  name = "awsrestartproject"
  owner = "ds"
}

### Select the newest AMI

data "aws_ami" "latest_linux_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*x86_64"]
  }
}

### Create the EC2 instance

resource "aws_instance" "instance" {
ami = "ami-0ecb0bb5d6b19457a"
instance_type = "t2.micro"
availability_zone = "us-west-2a"
associate_public_ip_address = true
key_name = "vockey"
vpc_security_group_ids = ["sg-0b2125b2d84d22dd8"]
subnet_id = "subnet-0b0e0d644715ec90b"
# iam_instance_profile = "LabRole”
count = 1
tags = {
Name = "Sandbox1"
}
}