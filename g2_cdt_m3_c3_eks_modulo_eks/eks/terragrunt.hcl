# /ruta/a/tu/proyecto/entorno/terragrunt.hcl
terraform {
  source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-eks?ref=main"
}

inputs = {
  provider_region                = "eu-west-2"
  tag_value                      = "MyClusterTag"
  vpc_id                         = "vpc-0c9f03551cb17af5d"
  subnets                        = ["subnet-0399f98a4db137765", "subnet-0b0842bc836a4b6cb"]
  cluster_endpoint_public_access = true
  cluster_endpoint_private_access = true
  instance_type                  = "t3.small"

  eks_managed_node_groups = {
    mi-nodo-grupo = {
      desired_size = 2
      max_size     = 3
      min_size     = 1

      instance_types = ["t3.small"]
    }
  }
}