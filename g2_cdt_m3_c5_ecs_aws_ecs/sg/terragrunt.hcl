include "root" {
    path = find_in_parent_folders("root.hcl")
    expose=true
}

terraform {
    source = "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//cloud-resources/g2-cdt-prod-sg/main.tf"
  }


inputs = {
  security_group_name = "Grupo2-modulo3-clase-5"
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
