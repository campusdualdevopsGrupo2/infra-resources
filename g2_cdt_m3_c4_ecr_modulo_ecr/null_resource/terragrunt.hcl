terraform {
  source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-null-resource?ref=main"
}

inputs = {
  command            = <<EOT
     bash -c 'docker build -t 248189943700.dkr.ecr.eu-west-2.amazonaws.com/ejer:latest . &&
     docker push 248189943700.dkr.ecr.eu-west-2.amazonaws.com/ejer:latest'
    EOT
    
  working_directory  = "./"
  env_vars = {
  ENVIRONMENT = "dev"
}

}






