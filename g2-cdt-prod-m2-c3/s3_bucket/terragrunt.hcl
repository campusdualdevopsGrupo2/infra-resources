terraform {
  source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-s3?ref=main"
}

inputs = {
  bucket_name = "practica-recursos3"
  region              = "eu-west-2"
}
