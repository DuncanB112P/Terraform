variable "vpc_name" {
  type    = string
  default = "custom_vpc"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

########################  PUBLIC subnet cider blocks  ########################

variable "public_subnet1_cidr" {
  default = "10.0.6.0/24"
}

variable "public_subnet2_cidr" {
  default = "10.0.7.0/24"
}

###################  PUBLIC subnet cider Availability Zones  #################

variable "public_subnet1_az" {
  default = "us-east-1a"
}

variable "public_subnet2_az" {
  default = "us-east-1b"
}


########################  PRIVATE subnet cider blocks  ########################

variable "private_subnet1_cidr" {
  default = "10.0.64.0/24"
}

variable "private_subnet2_cidr" {
  default = "10.0.72.0/24"
}


###################  PRIVATE subnet Availability Zones  #######################

variable "private_subnet1_az" {
  default = "us-east-1a"
}

variable "private_subnet2_az" {
  default = "us-east-1b"
}


