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