terraform {
  source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//modulo2/clase8/wp_londres?ref=main"
}

inputs = {
  region              = "eu-west-2"
  vpc_id              = "vpc-0c9f03551cb17af5d"
  subnet_id           = "subnet-0b1fde2792247e7e4"
  allowed_ssh_cidr    = []  # Terraform usará automáticamente la IP pública de la máquina
  ami                 = "ami-06cff85354b67982b"
  instance_type       = "t2.micro"
  key_name            = "mi-clave-generada-g2-londres"
  instance_name       = "wordpress-instance"
  private_subnet_ids  = ["subnet-0399f98a4db137765", "subnet-0b0842bc836a4b6cb"]  # Define la subnet aquí
  db_name             = "rds_grupo2_wordpress-londres"
  db_username         = "wpuser"
  db_password         = "wpsecretpassword"
  aws_db_instance_class = "db.t3.micro"
  db_allocated_storage = 20
  db_engine_version   = "8.0"
}

terraform {
  source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//modulo2/clase8/wp_irlanda?ref=main"
}

inputs = {
  region              = "eu-west-1"
  vpc_id              = "vpc-0aad847febf809cf4"
  subnet_id           = "subnet-03f5b0dc5550de2c4"
  allowed_ssh_cidr    = []  # Terraform usará automáticamente la IP pública de la máquina
  ami                 = "ami-06cff85354b67982b"
  instance_type       = "t2.micro"
  key_name            = "mi-clave-generada-g2-irlanda"
  instance_name       = "wordpress-instance"
  private_subnet_ids  = ["subnet-0de031bfa5831cae1", "subnet-0ece7ad592169689c"]  # Define la subnet aquí
  db_name             = "rds_grupo2_wordpress-irlanda"
  db_username         = "wpuser"
  db_password         = "wpsecretpassword"
  aws_db_instance_class = "db.t3.micro"
  db_allocated_storage = 20
  db_engine_version   = "8.0"
}