include "root"{
    path = find_in_parent_folders("root.hcl")
    expose=true
}

remote_state {
    backend ="s3"
    generate={
        path="backend.tf"
         if_exists = "overwrite"
    } 
    config = {
        bucket         = include.root.locals.backend_bucket_name   # Nombre del bucket S3
        key            = "terragrunt/modulo3/clase8/file.tfstate"  # Ruta dentro del bucket S3
        region         = include.root.locals.aws_region
        encrypt        = true  # Encriptar el archivo de estado
        #dynamodb_table = "my-lock-table"  # Usar DynamoDB para el bloqueo de estado
        #acl            = "private"  # ACL del bucket, usualmente "private"
  }
}

terraform {
  source = "https://github.com/campusdualdevopsGrupo2/cloud-resources.git//modulo3/clase8/chat_app/terraform"

}
dependency "eks" {
  config_path = "../eks"  # Ruta relativa al módulo VPC
  mock_outputs = {#outputs falsos para que no falle de momento
    cluster_name = "mock-eks-output"
  }
}
inputs = {
  cluster_name=dependency.eks.outputs.cluster_name
}

