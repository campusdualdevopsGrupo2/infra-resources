terraform {
  source = "git::https://github.com/campusdualdevopsGrupo2/cloud-resources.git//g2-cdt-prod-kubernetes-service?ref=main"
}

inputs = {
  name          = "nginx-lb"
  namespace     = "default"
  kubeconfig_path              = "/home/jorge/.kube/config"
  kubeconfig_context           = "arn:aws:eks:eu-west-2:248189943700:cluster/mi-cluster-jvs"
  labels        = {
    "label1" = "value1"
    "label2" = "value2"
  }
  selector      = {
    "app" = "nginx"
  }
  service_type  = "LoadBalancer"  # o "LoadBalancer"
  ports         = [
    {
      name        = "http"
      port        = 80
      target_port = 80
      protocol    = "TCP"
    },
  ]
  external_ips  = []  # Solo si service_type es "LoadBalancer"
}
   