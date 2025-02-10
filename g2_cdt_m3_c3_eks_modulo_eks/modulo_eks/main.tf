module "eks" {
  source          = "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//modulo3/clase3/modulo_eks"
  eks_cluster_name = var.eks_cluster_name
  vpc_id          = var.vpc_id
  subnet_ids      = var.subnet_ids
}

terraform {
  backend "s3" {
    bucket  = "proyecto-devops-grupo-dos"          # Nombre de tu bucket S3
    key     = "modulo_eks-modulo3/terraform.tfstate"  # Ruta y nombre del archivo de estado dentro del bucket
    region  = "eu-west-2"                           # Región donde está tu bucket S3
    encrypt = true                                  # Habilita el cifrado en el bucket
  }
}