locals{
  aws_region           = "eu-west-2" # Ajusta esto según tu región deseada
  bucket_name          = "practica-s3-con-politica-de-retencion"
  acl                  = "private" # Puedes cambiar esto si necesitas otro tipo de acceso
}
provider "aws" {
  region = local.aws_region  # Usamos una variable para la región, que podemos definir en variables.tf

}

module "s3_politica_de_retencion_y_web_estatica" {
  source= "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//modulo4/clase3/bucket-s3-con-politica-de-retencion"
  aws_region=local.aws_region
  bucket_name=local.bucket_name
  acl=local.acl

}
#modulo4/clase3/bucket-s3-con-politica-de-retencion
terraform {
  backend "s3" {
    bucket  = "proyecto-devops-grupo-dos"          # Nombre de tu bucket S3
    key     = "s3-práctica-6-2-2025/terraform.tfstate"  # Ruta y nombre del archivo de estado dentro del bucket
    region  = "eu-west-2"                           # Región donde está tu bucket S3
    encrypt = true                                  # Habilita el cifrado en el bucket
  }
}