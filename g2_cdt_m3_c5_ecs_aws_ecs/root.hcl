generate "provider"{
  path="provider.tf"
  if_exists="overwrite_terragrunt"
  contents=<<EOF
  provider "aws"{
    aws_region="eu-west-2"
  }
  EOF
}