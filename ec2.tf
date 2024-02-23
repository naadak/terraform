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
ami = aws_ami.latest_linux_ami.id
instance_type = "t2.micro"
availability_zone = "us-west-2a"
associate_public_ip_address = true
key_name = "vockey"
vpc_security_group_ids = [aws_security_group.sg_vpc.id]
subnet_id = aws_subnet.public-1.id
# iam_instance_profile = "LabRole”
count = 1
tags = {
Name = "Sandbox1"
}
}