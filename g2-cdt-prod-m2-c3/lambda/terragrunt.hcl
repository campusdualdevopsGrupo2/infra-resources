dependency "s3_bucket" {
  config_path = "../s3_bucket"
}

terraform {
  source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-función-lambda-para-s3?ref=main"
}

inputs = {
  region               = "eu-west-2"
  lambda_function_name = "practica_recursos-3"
  s3_bucket            = dependency.s3_bucket.outputs.bucket_name
  s3_key               = "lambda-code.zip"
  runtime              = "nodejs14.x"
  handler              = "index.handler"
}
