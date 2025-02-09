terraform {
  source = "/home/jorge/Documentos/Bootcamp/Nuevo Grupo/cloud-resources/modulo3/clase4"
}

inputs = {
  # Configuración de EKS
  provider_region                  = "eu-west-2"
  cluster_name_prefix              = "mi-cluster-g2"
  tag_value                        = "env-dev"
  cluster_version                  = "1.32"
  vpc_id                           = "vpc-0c9f03551cb17af5d"
  subnets                          = ["subnet-0399f98a4db137765", "subnet-0b0842bc836a4b6cb"]
  cluster_endpoint_public_access   = true
  cluster_endpoint_private_access  = true
  tags                             = {
    Environment = "dev"
    Project     = "my-project"
  }
  node_group_config = {
    mi-nodo-grupo = {
      desired_size   = 2
      max_size       = 3
      min_size       = 1
      instance_types = ["t3.small"]
    }
  }
  cluster_enabled_log_types = ["api", "audit"]

  # Configuración de ECR
  repository_name = "mi-repositorio-ecr-g2"
  
  tags = {
    Project = "Repositorio-g2"
    Owner   = "TuNombre"
  }

  policy_sid        = "new policy 2"
  policy_principals = [
    "arn:aws:sts::248189943700:assumed-role/AWSReservedSSO_EKS-alumnos_a4561514b13725b0/jorge.vidal@campusdual.com"
  ]
  policy_actions = [
    "ecr:GetDownloadUrlForLayer",
    "ecr:BatchGetImage",
    "ecr:BatchCheckLayerAvailability",
    "ecr:PutImage",
    "ecr:InitiateLayerUpload",
    "ecr:UploadLayerPart",
    "ecr:CompleteLayerUpload",
    "ecr:DescribeRepositories",
    "ecr:GetRepositoryPolicy",
    "ecr:ListImages",
    "ecr:DeleteRepository",
    "ecr:BatchDeleteImage",
    "ecr:SetRepositoryPolicy",
    "ecr:DeleteRepositoryPolicy"
  ]
}





