terraform {
    source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-sg?ref=main"
  }


inputs = {
  security_group_name = "g2-modulo3-clase-3"
  vpc_id              = "vpc-0c9f03551cb17af5d"
  aws_region          = "eu-west-2"
  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]
}
