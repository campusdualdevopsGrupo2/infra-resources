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
