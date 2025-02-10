provider "aws" {
  region = local.aws_region  # Usamos una variable para la región, que podemos definir en variables.tf

}
locals{
  aws_region           = "eu-west-2" # Ajusta esto según tu región deseada


}

module "ecs"{
    source= "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//fixed_resources/ecs"
}

module "ecs_recursos"{
    source= "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//modulo3/clase5/ecs_resources"
    cluster_id=module.ecs.ecs_cluster_id
}


