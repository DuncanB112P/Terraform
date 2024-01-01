resource "aws_db_instance" "database_instance" {
  allocated_storage      = 5
  db_name                = "rds_db"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  username               = "rdsuser"
  password               = "rdspassword"
  parameter_group_name   = "default.mysql5.7"
  vpc_security_group_ids = [var.db_security_group_id]
  availability_zone      = "us-east-1a"
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group1.id
  skip_final_snapshot    = true
}

resource "aws_db_subnet_group" "db_subnet_group1" {
  name       = "db_subnet_group1"
  subnet_ids = [var.private_subnet1_id, var.private_subnet2_id]

  tags = {
    Name = "db_subnet_group1"
  }
}

