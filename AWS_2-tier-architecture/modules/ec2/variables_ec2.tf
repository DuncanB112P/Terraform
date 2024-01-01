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

variable "web_sg_id" {}

variable "public_subnet1_id" {}