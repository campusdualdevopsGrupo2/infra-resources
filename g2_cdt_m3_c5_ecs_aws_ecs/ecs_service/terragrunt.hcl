include "root" {
    path = find_in_parent_folders("root.hcl")
    expose=true
}

dependency "ecs_name" {
  config_path = "../ecs"
}

dependency "task_definition_arn" {
  config_path = "../ecs_task_definition"
}

terraform {
  source = "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//cloud-resources/g2-cdt-prod-aws-ecs-service/main.tf"
}

inputs = {
    name = "Grupo2-nginx-service"
    cluster = dependency.ecs_name.outputs.ecs_cluster_name
    task_definition = dependency.task_definition_arn.outputs.task_definition_arn
    desired_count = 2
    launch_type = "FARGATE"
    network_configuration = {
        subnets = []
        security_groups = []
        assign_public_ip = true
    }
    load_balancers = {
        target_group_arn = ""
        container_name = "nginx"
        container_port = 80
    }
    tags = ""
}