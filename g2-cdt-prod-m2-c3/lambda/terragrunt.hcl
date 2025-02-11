dependency "s3_bucket" {
  config_path = "../s3_bucket"
}

terraform {
  source = "/home/jorge/Documentos/Bootcamp/Nuevo Grupo/cloud-resources/g2-cdt-prod-función-lambda-para-s3"
}

inputs = {
  region               = "eu-west-2"
  lambda_function_name = "practica_recursos-3"
  s3_bucket            = dependency.s3_bucket.outputs.bucket_name
  s3_key               = "lambda-code.zip"
  runtime              = "nodejs14.x"
  handler              = "index.handler"
}
