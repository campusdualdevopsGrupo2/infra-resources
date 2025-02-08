module "eks"{
    source= "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//fixed_resources/eks"
}


module "chat_app_with_eks" {
  source= "git@github.com:campusdualdevopsGrupo2/cloud-resources.git//modulo3/clase8/chat_app/terraform"

}