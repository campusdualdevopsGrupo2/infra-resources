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
  source= "https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-aws-lb"
}

dependency "alb_sg"{
    config_path="../alb_sg"
}
output "security_group_id" {
  value = dependency.alb_sg.outputs.security_group_id
}

inputs={
    name="alb_Grupo2"
    tag_value=include.root.locals.tag_value
    subnets=include.root.locals.subnets
    security_groups=[dependency.alb_sg.outputs.security_group_id]

}


