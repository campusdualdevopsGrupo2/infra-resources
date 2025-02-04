data "terraform_remote_state" "ecs" {
  backend = "s3"  # Usa el mismo backend S3 configurado en el proyecto EKS

  config = {
    bucket = "proyecto-devops-grupo-dos"
    key    = "ecs/terraform.tfstate"
    region = "eu-west-2
  }

}