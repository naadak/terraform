resource "aws_instance" "instance" {
ami = "ami-0ecb0bb5d6b19457a"
instance_type = "t2.micro"
availability_zone = "us-west-2a"
associate_public_ip_address = true
key_name = "vockey"
vpc_security_group_ids = ["sg-0b2125b2d84d22dd8"]
subnet_id = "subnet-0dc655178f6912632"
# iam_instance_profile = "LabRole”
count = 1
tags = {
Name = "Sandbox1"
}
}