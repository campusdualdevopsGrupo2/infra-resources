include "root" {
    path = find_in_parent_folders("root.hcl")
    expose=true
}

dependency "security_group_id" {
  config_path = "../sg"
}

terraform {
  source = "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//cloud-resources/g2-cdt-prod-aws-lb/main.tf"
}

inputs = {
    name = "Grupo2-load-balancer"
    internal = false
    load_balancer_type = "application"
    subnets = ["subnet-0b1fde2792247e7e4", "subnet-0f2f92016f5508fed"]
    security_groups = [dependency.security_group_id.outputs.security_group_id]
    enable_deletion_protection = false
    tags = {
        Name = "Grupo2-load-balancer"
    }
}