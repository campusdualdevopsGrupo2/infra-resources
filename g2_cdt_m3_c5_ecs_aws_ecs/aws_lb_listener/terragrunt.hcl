include "root" {
    path = find_in_parent_folders("root.hcl")
    expose=true
}

dependency "lb_arn" {
  config_path = "../aws_lb"
}

terraform {
  source = "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//cloud-resources/g2-cdt-prod-aws-lb-listener/main.tf"
}

inputs = {
    load_balancer_arn = dependency.lb_arn.outputs.lb_arn
    port = "80"
    protocol = "HTTP"
    ssl_policy = ""
    certificate_arn = ""
    default_actions = [
    {
      type             = "fixed-response"
      fixed_response   = {
        status_code  = 200
        content_type = "text/plain"
        message_body = "OK"
      }
    },
    {
      type             = "redirect"
      redirect = {
        status_code = ""
        host        = ""
        path        = ""
        query       = ""
        port        = "80"
        protocol    = "HTTP"
      }
    }
  ]
}