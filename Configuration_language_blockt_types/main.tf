provider "aws" {
region = "us-east-1"
}
resource "aws_instance" "web" { 
ami = "ami-0230bd60aa48260c6"
instance_type = "t2.micro"
subnet_id = "subnet-0005e16c2308783e4"
vpc_security_group_ids = ["sg-059ef2c191eb43c89"]
tags = {
"Terraform" = "true"
}
}