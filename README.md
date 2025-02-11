# Infra Resources


Este repositorio contiene la infraestructura necesaria para la automatización y despliegue de recursos en AWS utilizando herramientas como Terraform, Ansible y Kubernetes.

## 📂 Estructura del Repositorio

- `.github/workflows/` → Workflows de GitHub Actions para CI/CD.
- `g2_cdt_m2_c4_ansible_ansible/ec2_wordpress_ansible/` → Configuración de WordPress en EC2 usando Ansible.
- `g2_cdt_m2_c8_terragrunt_terragrunt_wordpress/` → Configuración de WordPress con Terragrunt.
- `g2_cdt_m3_c2_kubernetes_kubernetes/` → Configuración de Kubernetes.
- `g2_cdt_m3_c3_eks_modulo_eks/modulo_eks/` → Despliegue de EKS.
- `g2_cdt_m3_c4_ecr_modulo_ecr/` → Configuración de ECR.
- `g2_cdt_m3_c5_ecs_aws_ecs/` → Configuración de Amazon ECS.
- `g2_cdt_m3_c6_ecs_conf_ecs/` → Configuración avanzada de ECS.
- `g2_cdt_m3_c7_eks_kubernetes_manifest/` → Manifiestos para Kubernetes en EKS.
- `g2_cdt_m3_c8_project_chat_app/chat_app/` → Aplicación de chat en tiempo real.
- `g2_cdt_m4_c4_bucket-s3-con-politica-de-retencion/` → Configuración de un bucket S3 con política de retención.

## 🚀 Últimos Cambios

- Se han actualizado los nombres de los módulos.
- Se han añadido mejoras en la configuración de despliegue.

## ⚙️ Requisitos

- [Terraform](https://www.terraform.io/downloads)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- [Git](https://git-scm.com/downloads)

## 📖 Uso

1. Clona el repositorio:
   ```bash
   git clone https://github.com/campusdualdevopsGrupo2/infra-resources.git
   ```
2. Accede al módulo que deseas usar:
   ```bash
   cd g2_cdt_m3_c5_ecs_aws_ecs
   ```
3. Aplica la configuración con Terraform o Ansible:
   ```bash
   terraform apply
   ```

## 🛠 Contribución

1. Crea un fork del repositorio.
2. Crea una nueva rama con un nombre descriptivo.
3. Realiza tus cambios y realiza un commit.
4. Abre un Pull Request para revisión.

## 📜 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo `LICENSE` para más detalles.

---

✉️ Para dudas o sugerencias, contacta con los administradores del repositorio o abre un issue.





