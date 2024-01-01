output "rds_database_id" {
  value = aws_db_instance.database_instance.id
}

output "rds_database_name" {
  value = aws_db_instance.database_instance.db_name
}

output "rds_database_resource_id" {
  value = aws_db_instance.database_instance.resource_id
}

output "rds_database_address" {
  value = aws_db_instance.database_instance.address
}

output "rds_database_endpoint" {
  value = aws_db_instance.database_instance.endpoint
}

output "rds_database_port" {
  value = aws_db_instance.database_instance.port
}
