include "root" {
    path = find_in_parent_folders("root.hcl")
    expose=true
}

terraform {
  source = "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-ecs/main.tf"
}

inputs = {
    tag_value = "Grupo2"
}