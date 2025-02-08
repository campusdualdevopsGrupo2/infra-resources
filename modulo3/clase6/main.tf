provider "aws" {
  region = local.aws_region  # Usamos una variable para la región, que podemos definir en variables.tf

}
locals{
  aws_region           = "eu-west-2" # Ajusta esto según tu región deseada
    db_username="algo"
  db_password="pñjqnafas"

}

module "ecs"{
    source= "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//fixed_resources/ecs"
}

module "ecr"{
    source= "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//fixed_resources/ecr"
}

module "ecs_recursos"{
    source= "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//modulo3/clase6/ecs_resources"
    cluster_id=module.ecs.ecs_cluster_id
        db_username=local.db_username
    db_password=local.db_password
}

