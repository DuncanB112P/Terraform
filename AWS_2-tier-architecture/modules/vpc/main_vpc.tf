##########################     Define the VPC    ############################

resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name      = "custom_vpc"
    Terraform = "true"
  }
}
########################    Deploy the public subnets  #######################

resource "aws_subnet" "public_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet1_cidr
  availability_zone = var.public_subnet1_az

  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet1"
  }
}


resource "aws_subnet" "public_subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.public_subnet2_cidr
  availability_zone = var.public_subnet2_az

  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet2"
  }
}


############################    Deploy PRIVATE subnets    ####################

resource "aws_subnet" "private_subnet1" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet1_cidr
  availability_zone = var.private_subnet1_az

  map_public_ip_on_launch = true

  tags = {
    Name = "private_subnet1"
  }
}


resource "aws_subnet" "private_subnet2" {
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = var.private_subnet2_cidr
  availability_zone = var.private_subnet2_az

  map_public_ip_on_launch = true

  tags = {
    Name = "private_subnet2"
  }
}


#####################   Create & Attach INTERNET GATEWAY   #####################

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "my_igw"
  }
}

######################    Create PUBLIC ROUTE TABLE    #########################

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
    #nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "public_rtb"
  }
}


######################    Associate PUBLIC ROUTE TABLE    ######################

resource "aws_route_table_association" "sub_assoc1" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "sub_assoc2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_route_table.id
}



######################    Create NAT GATEWAY    ##############################

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet1.id
  tags = {
    Name = "nat_gateway"
  }
}


######################    Create ELASTIC IP    ################################


resource "aws_eip" "nat_gateway_eip" {
  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "natgw_eip"
  }
}


######################    Create PRIVATE ROUTE TABLE    #######################

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "private_rtb"
  }
}


######################    Associate PRIVATE ROUTE TABLE    #####################

resource "aws_route_table_association" "pvt_rtb_assoc1" {
  depends_on     = [aws_subnet.private_subnet1]
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet1.id
}

resource "aws_route_table_association" "pvt_rtb_assoc2" {
  depends_on     = [aws_subnet.private_subnet2]
  route_table_id = aws_route_table.private_route_table.id
  subnet_id      = aws_subnet.private_subnet2.id
}








