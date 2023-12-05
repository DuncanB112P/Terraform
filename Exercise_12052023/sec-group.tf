resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-sg"
  description = "security group for jenkins ec2"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [format("%s/%s",data.external.whatismyip.result["internet_ip"],32)]
  }

  ingress {
    description = "HTTP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins"
  }
}

data "external" "whatismyip" {
  program = ["/bin/bash" , "${path.module}/whatismyip.sh"]
}