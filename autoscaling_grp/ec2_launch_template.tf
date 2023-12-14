/* Create a launch template for ec2 instance using an Ubuntu image. The ec2 
instance should have a key pair associated for SSH access, and it should 
reference a security group created in the terraform configuration. */

resource "aws_launch_template" "ec2_template_1" {
  name                                 = "ec2_template_1"
  image_id                             = "ami-0fc5d935ebf8bc3bc"
  instance_initiated_shutdown_behavior = "terminate"
  instance_type                        = "t2.micro"
  key_name                             = "Sam-kp"

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.sg1.id]
  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "ec2_asg"
    }
  }
  user_data = filebase64("${path.module}/script_apache2.sh")
}