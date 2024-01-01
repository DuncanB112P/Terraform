resource "aws_instance" "web_server1" {
  ami                    = var.ami
  instance_type          = var.ec2_type
  subnet_id              = var.public_subnet1_id
  vpc_security_group_ids = [var.web_sg_id]
  key_name               = var.key_name
  tags = {
    Name = "web_server1"
  }
  user_data = filebase64("${path.module}/script_apache2.sh")
}

resource "aws_instance" "web_server2" {
  ami                    = var.ami
  instance_type          = var.ec2_type
  subnet_id              = var.public_subnet2_id
  vpc_security_group_ids = [var.web_sg_id]
  key_name               = var.key_name
  tags = {
    Name = "web_server2"
  }
  user_data = filebase64("${path.module}/script_apache2.sh")
}