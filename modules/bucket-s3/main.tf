resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name  # Usamos el nombre del bucket desde una variable

  lifecycle {
    prevent_destroy = false  # Allow the bucket to be destroyed
  }
}

resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.bucket

  versioning_configuration {
    status = "Suspended"  # 'Suspended' if versioning is to be disabled
  }
}

terraform {
  backend "s3" {
    bucket = var.backend_bucket_name          # Nombre de tu bucket S3
    key    = "s3/terraform.tfstate"           # Ruta y nombre del archivo de estado dentro del bucket
    region = var.aws_region                           # Región donde está tu bucket S3
    encrypt = true                                   # Habilita el cifrado en el bucket
    #dynamodb_table = "mi-tabla-dynamodb"             # (Opcional) Usa DynamoDB para el bloqueo del estado (si lo deseas)
  }
}