resource "aws_ecs_service" "nodde_service" {
  name            = "node-service"
  cluster         = data.terraform_remote_state.ecs.outputs.ecs_cluster_id # Aquí se especifica el cluster donde se ejecutará la tarea
  task_definition = aws_ecs_task_definition.flask_task.arn
  desired_count   = 1

  launch_type = "FARGATE"  # Especificamos FARGATE como el tipo de lanzamiento

  network_configuration {
    subnets          = data.terraform_remote_state.ecs.outputs.subnets
    assign_public_ip = true

    security_groups = [aws_security_group.ecs_service_sg.id] # Aquí agregas el security group necesario
  }
  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_targets2.arn
    container_name   = "node-container"
    container_port   = 80
  }

}

