provider "aws" {
  region = local.aws_region  # Usamos una variable para la región, que podemos definir en variables.tf

}
locals{
  aws_region           = "eu-west-2" # Ajusta esto según tu región deseada

}

module "eks"{
    source= "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//fixed_resources/eks"
}


module "chat_app_with_eks" {
  source= "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//modulo3/clase8/chat_app/terraform"

}