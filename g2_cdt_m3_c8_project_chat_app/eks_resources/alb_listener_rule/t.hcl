include "root" {
  path = find_in_parent_folders("root.hcl")
  expose = true
}

remote_state {
  backend = "s3"
  generate = {
    path = "backend.tf"
    if_exists = "overwrite"
  }
  config = {
    bucket = include.root.locals.backend_bucket_name   # Nombre del bucket S3
    key = "terragrunt/eks/${path_relative_to_include()}/file.tfstate"  # Ruta dentro del bucket S3
    region = include.root.locals.aws_region
    encrypt = true  # Encriptar el archivo de estado
  }
}

terraform {
  source = "https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-aws-lb-listener-rule"
}

dependency "alb_listener" {
  config_path = "../alb"
}

output "lb_listener_arn" {
  value = dependency.alb_listener.outputs.listener_arn
}

inputs = {
  # Variables específicas del listener rule
  listener_arn = dependency.alb.outputs.lb_listener_arn   # ARN del Listener desde el módulo ALB
  priority = 20  # Prioridad de la regla

  actions = [
    {
      type = "redirect"
      redirect = {
        host        = data.external.get_dns.result["dns"]  # Dirección a la que se redirige
        port        = "80"  # Puerto al que se redirige (puedes cambiarlo si es necesario)
        protocol    = "HTTP"  # Protocolo de la redirección (HTTP o HTTPS)
        status_code = "HTTP_301"  # Código de redirección (301 para redirección permanente)
      }
    }
  ]

  conditions = [
    {
      path_pattern = ["/*"]  # Asegura que la regla se aplique a todas las rutas
    }
  ]
}
