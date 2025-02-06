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

resource "aws_s3_bucket_lifecycle_configuration" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    id     = "rule-1"
    status = "Enabled"

    expiration {
      days = 30  # Eliminar objetos después de 30 días
    }

    # Puedes añadir otras acciones de transición/expiración aquí
  }
}

resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.my_bucket.id

  index_document {
    suffix = "super.html"
  }

}
terraform {
  backend "s3" {
    bucket = "proyecto-devops-grupo-dos"          # Nombre de tu bucket S3
    key    = "s3-práctica-6-2-2025/terraform.tfstate"           # Ruta y nombre del archivo de estado dentro del bucket
    region = "eu-west-2"                           # Región donde está tu bucket S3
    encrypt = true                                   # Habilita el cifrado en el bucket
  }
}

