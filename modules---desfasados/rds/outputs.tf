output "rds_security_group_id" {
  description = "ID del Security Group para RDS"
  value       = aws_security_group.rds_sg.id
}

output "db_subnet_group_name" {
  description = "Nombre del DB Subnet Group"
  value       = aws_db_subnet_group.my_db_subnet_group.name
}

output "mysql_db_endpoint" {
  description = "Endpoint de la instancia MySQL RDS"
  value       = aws_db_instance.mysql_db.endpoint
}
