terraform {
  source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-kubernetes-manifest?ref=main"
}



inputs = {
  kubeconfig_path              = "/home/jorge/.kube/config"
  kubeconfig_context           = "arn:aws:eks:eu-west-2:248189943700:cluster/mi-cluster-jvs"
  manifest_yaml                = "/home/jorge/Documentos/Bootcamp/Nuevo Grupo/infra-resources/g2_cdt_m3_c2_kubernetes_kubernetes/nginx-deployment.yaml"
  manifest_name                = "nginx-deployment"
}
