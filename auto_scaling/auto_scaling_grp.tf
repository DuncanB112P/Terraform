/* Create an auto-scaling group that uses the launch template */

resource "aws_autoscaling_group" "test_grp" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  vpc_zone_identifier = ["subnet-09f43c28c89cf7730", "subnet-03c71084e4e34f426"]

  launch_template {
    id      = aws_launch_template.ec2_template_1.id
    version = "$Latest"
  }
}

