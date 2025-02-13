dependency "sg" {
  config_path = "../sg"
}

terraform {
  source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-rds?ref=main"
}

inputs = {
  # Configuración de la instancia de base de datos
  allocated_storage      = 20                    # Almacenamiento asignado en GB
  engine                 = "mysql"               # Motor de base de datos (ej. mysql, postgres, etc.)
  instance_class         = "db.t3.micro"         # Clase de instancia de la DB
  db_name                = "mydatabase"          # Nombre de la base de datos
  username               = "admin"               # Usuario administrador
  password               = "changeme123"         # Contraseña (¡asegúrate de usar un valor seguro!)
  
  # Nombre del grupo de subredes para la DB
  db_subnet_group_name   = "my-db-subnet-group"
  
  # Grupos de seguridad a los que se asociará la DB
  vpc_security_group_ids = [dependency.sg.outputs.security_group_id]  # Reemplaza con el ID real de tu SG
  
  skip_final_snapshot    = true                  # Evita snapshot final al destruir la DB
  deletion_protection    = false                 # Permite eliminar la DB si es necesario
  publicly_accessible    = false                 # La DB no será accesible públicamente
  multi_az               = false                 # No se crea en múltiples zonas de disponibilidad
  storage_type           = "gp2"                 # Tipo de almacenamiento
  
  # Configuración del grupo de subredes para la DB
  subnet_ids             = [
    "subnet-0b0842bc836a4b6cb",    # Reemplaza con los IDs reales de las subredes
    "subnet-0eb5d5076276d2346"
  ]
  subnet_group_description = "Grupo de subred para la DB"
  db_subnet_group_tags   = {
    Environment = "dev"
  }
  
  # Etiquetas generales para la instancia DB
  tags = {
    Environment = "dev"
    Project     = "mi-proyecto"
  }
}
