#####################   VPC Outputs    #######################

output "custom_vpc_id" {
  value = aws_vpc.vpc.id
}

output "custom_vpc_name" {
  value = aws_vpc.vpc.tags.Name
}

output "custom_vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}


#####################   Subnet Outputs    #######################

output "public_subnet1_id" {
  value = aws_subnet.public_subnet1.id
}

output "public_subnet2_id" {
  value = aws_subnet.public_subnet2.id
}

output "private_subnet1_id" {
  value = aws_subnet.private_subnet1.id
}

output "private_subnet2_id" {
  value = aws_subnet.private_subnet2.id
}