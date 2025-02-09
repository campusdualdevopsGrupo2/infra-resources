terraform {
  source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//modulo2/clase4?ref=main"
}

inputs = {
  region              = "eu-west-2"
  vpc_id              = "vpc-0c9f03551cb17af5d"
  subnet_id           = "subnet-0b1fde2792247e7e4"
  allowed_ssh_cidr    = []  # Terraform usará automáticamente la IP pública de la máquina
  ami                 = "ami-06cff85354b67982b"
  instance_type       = "t2.micro"
  key_name            = "mi-clave-generada-g2"
  instance_name       = "wordpress-instance"
  private_subnet_ids  = ["subnet-0399f98a4db137765", "subnet-0b0842bc836a4b6cb"]  # Define la subnet aquí
  db_name             = "rds_grupo2_wordpress"
  db_username         = "wpuser"
  db_password         = "wpsecretpassword"
  aws_db_instance_class = "db.t3.micro"
  db_allocated_storage = 20
  db_engine_version   = "8.0"
}

