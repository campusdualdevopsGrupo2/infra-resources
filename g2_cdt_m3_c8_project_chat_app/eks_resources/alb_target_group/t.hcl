include "root" {
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
        key            = "terragrunt/eks/${path_relative_to_include()}/file.tfstate"  # Ruta dentro del bucket S3
        region         = include.root.locals.aws_region
        encrypt        = true  # Encriptar el archivo de estado
        #dynamodb_table = "my-lock-table"  # Usar DynamoDB para el bloqueo de estado
        #acl            = "private"  # ACL del bucket, usualmente "private"
  }
}

terraform {
  source= "https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-aws-lb-target-group"
}


inputs={
    name="target_group_Grupo2"
    vpc_id=include.root.locals.vpc_id
    tag_value=include.root.locals.tag_value
    port        = 80
    protocol    = "http"
    target_type = "ip"



}


