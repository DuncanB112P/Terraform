
resource "aws_security_group" "db_sg" {
  name        = "db_sg"
  description = "Allow traffic"
  vpc_id      = var.custom_vpc_id


  ingress {
    description     = "Allow access"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.web_sg_id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "db_sg"
  }
}



  