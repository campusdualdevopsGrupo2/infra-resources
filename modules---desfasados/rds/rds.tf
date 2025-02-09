
resource "aws_security_group" "rds_sg" {
  name        = "${var.tag_value}-rds-sg"
  description = "Security group for MySQL RDS"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306         # Puerto por defecto de MySQL
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg-${var.tag_value}"
  }
}

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name        = "my-db-subnet-group-${var.tag_value}"
  description = "Subnets for RDS instance"
  subnet_ids  = var.subnets

  tags = {
    Name = "MyDbSubnetGroup-${var.tag_value}"
  }
}

resource "aws_db_instance" "mysql_db" {
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  identifier             = "mymysqldb${var.tag_value}"
  engine                 = var.engine
  instance_class         = var.instance_class
  allocated_storage      = var.allocated_storage
  db_name                = "${var.db_name}${var.tag_value}"
  username               = var.db_username
  password               = var.db_password
  skip_final_snapshot    = true
  publicly_accessible    = true
  multi_az               = var.replicas > 1 ? true : false
  storage_type           = "gp2"
  db_subnet_group_name   = aws_db_subnet_group.my_db_subnet_group.name

  tags = {
    Name = "MySQLDatabase-${var.tag_value}"
  }

  depends_on = [
    aws_security_group.rds_sg
  ]
}
