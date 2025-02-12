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
  source= "https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-sg"
}

inputs={
    name="alb_sg_group"
    vpc_id=include.root.locals.vpc_id
    tag_value=include.root.locals.tag_value
    ingress_rules=[
        {
            from_port=80
            to_port=80
            protocol="tcp"
            cidr_blocks=["0.0.0.0/0"]
        }
    ]
    egress_rules=[
        {
            from_port=0
            to_port=0
            protocol="-1"
            cidr_blocks=["0.0.0.0/0"]
        }
    ]

}


