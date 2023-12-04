terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.1.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Jenkins_server" {
  ami                    = "ami-0fc5d935ebf8bc3bc"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  key_name               = "Sam-kp"
  tags = {
    Name = "JenkinsInstance"
  }
  user_data = <<EOF
#!/bin/bash
wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > dev/null
apt update
apt install fontconfig openjdk-17-jre -y
apt install jenkins -y
EOF
}


resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-sg"
  description = "security group for jenkins ec2"
  vpc_id      = "vpc-0197439ef63392c10"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["174.104.215.173/32"]
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

resource "aws_s3_bucket" "s3" {
  bucket = "jenkins-artifacts120223"
  tags = {
    Name        = "Jenkins-data"
    Environment = "Dev"
  }
}
