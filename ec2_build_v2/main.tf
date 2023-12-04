terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.29.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "Jenkins_server" {
  ami                    = var.ami
  instance_type          = var.ec2_type
  vpc_security_group_ids = [aws_security_group.jenkins-sg.id]
  key_name               = var.key_name
  tags = {
    Name = var.instance_name
  }
  user_data = file("userdata_jenkins.sh")
}

resource "aws_security_group" "jenkins-sg" {
  name        = "jenkins-sg"
  description = "security group for jenkins ec2"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
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
  bucket = var.bucket_name
  tags = {
    Name        = "Jenkins-data"
    Environment = "Dev"
  }
}