variable "db_username" {
  description = "Nombre de usuario para la base de datos"
  type        = string
}

variable "db_password" {
  description = "Contraseña para la base de datos"
  type        = string
  sensitive   = true
}

variable "replicas" {
  description = "Número de réplicas para configurar Multi-AZ (si es mayor a 1 se activa)"
  type        = number
  default     = 1
}

variable "engine" {
  description = "Motor de base de datos (por ejemplo, mysql)"
  type        = string
  default     = "mysql"
}

variable "instance_class" {
  description = "Clase de instancia para la base de datos"
  type        = string
  default     = "db.t3.micro"
}

variable "allocated_storage" {
  description = "Espacio de almacenamiento asignado (en GB)"
  type        = number
  default     = 10
}

variable "db_name" {
  description = "Nombre base para la base de datos"
  type        = string
  default     = "mydatabase"
}

variable "tag_value" {
  description = "Valor utilizado para personalizar nombres y etiquetas"
  type        = string
}

variable "vpc_id" {
  description = "ID de la VPC donde se desplegará el EKS"
  type        = string
}

variable "subnets" {
  description = "Lista de IDs de subnets para el EKS"
  type        = list(string)
}
