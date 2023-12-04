variable "ami" {
  type    = string
  default = "ami-0fc5d935ebf8bc3bc"
}

variable "ec2_type" {
  description = "The type of instance to start"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = "Sam-kp"
}

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Jenkins_instance"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0197439ef63392c10"
}

variable "bucket_name" {
  type    = string
  default = "jenkins-bucket-spd-12022023"
}