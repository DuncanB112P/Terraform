/* Create a security group for to be used by the launch template.
The security group should alloww http access on port 80 from anyhere, and 
SSH from the user's IP address on port 22 */

resource "aws_security_group" "sg1" {
  name        = "sg1"
  description = "security group for ec2"
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
    from_port   = 80
    to_port     = 80
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
    Name = "sg1"
  }
}
