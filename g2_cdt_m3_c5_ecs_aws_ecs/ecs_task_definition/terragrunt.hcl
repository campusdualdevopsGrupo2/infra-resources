include "root" {
    path = find_in_parent_folders("root.hcl")
    expose=true
}

terraform {
  source = "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//cloud-resources/g2-cdt-prod-aws-ecs-task-definition/main.tf"
}

inputs = {
    family = "Grupo2-nginx-task"
    execution_role_arn = "awsvpc"
    task_role_arn = ""
    network_mode = ""
    cpu = "256"
    memory = "512"
    requires_compatibilities = ["FARGATE"]

    container_definitions = [
        {
            name      = "nginx"
            image     = "nginx:latest"  
            essential = true

            portMappings = [
                {
                containerPort = 80  
                hostPort      = 80  
                }
            ]

            memory            = 512      
            memoryReservation = 256
        }
    ]

    
}