resource "aws_ecs_task_definition" "node_task" {
  family                   = "node-task-${local.tag_value}"
  requires_compatibilities = ["FARGATE"]
  network_mode= "awsvpc"
  cpu         = 256
  memory      = 1024
  #task_role_arn            = aws_iam_role.ecs_task_execution_role.arn  # IAM role para los permisos de la tarea
  execution_role_arn      = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name        = "node-container"
      image       = data.aws_ssm_parameter.container_image_flask.value
      #image =  var.custom_flask
      cpu         = 128
      memory      = 512
      essential   = true
      portMappings = [
        {
          containerPort = 80
          hostPort      = 80
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/${local.tag_value}/ecs/node-task-logs"        # Nombre del grupo de logs en CloudWatch
          "awslogs-region"        = "${local.aws_region}"                 # Región de AWS
          "awslogs-stream-prefix" = "node"                # Prefijo para el nombre de los flujos de logs
        }
      }
    }
  ])
}