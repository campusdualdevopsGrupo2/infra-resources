locals{
  aws_region           = "eu-west-2" # Ajusta esto según tu región deseada
  backend_bucket_name = "proyecto-devops-grupo-dos"
  vpc_id="vpc-0c9f03551cb17af5d"
  tag_value="Grupo2"
  subnets=["subnet-0399f98a4db137765","subnet-0b0842bc836a4b6cb","subnet-0eb5d5076276d2346"]
}
# Configuración del proveedor AWS
provider "aws" {
  region = "us-west-2"
}