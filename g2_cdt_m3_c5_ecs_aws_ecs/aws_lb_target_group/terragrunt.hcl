include "root" {
    path = find_in_parent_folders("root.hcl")
    expose=true
}

terraform {
  source = "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//cloud-resources/g2-cdt-prod-aws-lb-target-group/main.tf"
}

inputs = {
    name = "Grupo2-load-balancer-target-group"
    port = 80
    protocol = "HTTP"
    vpc_id = "vpc-0c9f03551cb17af5d"
    target_type = "ip"
    healthy_threshold = 3
    unhealthy_threshold = 3
    health_check_timeout = 5
    health_check_interval = 30
    health_check_path = "/"
    health_check_protocol = "HTTP"

    tags = {
        Name = "Grupo2-load-balancer-target-group"
    }
}