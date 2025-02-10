# Infra Resources

Este repositorio contiene los recursos de infraestructura para la gestión y despliegue de diversas aplicaciones y servicios en la nube.

📂 Estructura del Repositorio

.github/workflows/ → Contiene los workflows de GitHub Actions para la automatización del CI/CD.

g2_cdt_m2_c4_ansible_ansible/ec2_wordpress_ansible/ → Configuración de Ansible para desplegar WordPress en EC2.

g2_cdt_m2_c8_terragrunt_terragrunt_wordpress/ → Configuración de Terragrunt para el despliegue de WordPress.

g2_cdt_m3_c2_kubernetes_kubernetes/ → Configuración de Kubernetes.

g2_cdt_m3_c3_eks_modulo_eks/modulo_eks/ → Configuración de EKS.

g2_cdt_m3_c4_ecr_modulo_ecr/ → Configuración de Amazon ECR.

g2_cdt_m3_c5_ecs_aws_ecs/ → Configuración de Amazon ECS.

g2_cdt_m3_c6_ecs_conf_ecs/ → Configuración adicional para ECS.

g2_cdt_m3_c7_eks_kubernetes_manifest/ → Manifiestos de Kubernetes para EKS.

g2_cdt_m3_c8_project_chat_app/chat_app/ → Aplicación de chat en tiempo real.

g2_cdt_m4_c4_bucket-s3-con-politica-de-retencion/bucket-s3-con-politica-de-retencion/ → Configuración de un bucket S3 con una política de retención.

.gitignore → Archivo de configuración para ignorar archivos innecesarios en Git.

README.md → Documentación del repositorio.

🚀 Descripción General

Este repositorio forma parte del trabajo del equipo campusdualdevopsGrupo2, donde se desarrollan módulos de infraestructura utilizando herramientas como Terraform, Terragrunt, Ansible, Kubernetes, AWS y GitHub Actions.

📌 Últimos Cambios

Se realizaron actualizaciones en los workflows de GitHub Actions.

Se modificaron los nombres de los módulos para mayor claridad.

Se agregaron políticas de retención a un bucket S3 en g2_cdt_m4_c4_bucket-s3-con-politica-de-retencion.

Se agregó un .gitignore para optimizar el repositorio.

⚙️ Requisitos

Para utilizar este repositorio, asegúrate de tener instalados:

Terraform

Terragrunt

Ansible

AWS CLI

Git

📖 Uso

Clona el repositorio:

git clone https://github.com/campusdualdevopsGrupo2/infra-resources.git

Accede al directorio del módulo que deseas utilizar:

cd g2_cdt_m3_c3_eks_modulo_eks

Aplica la configuración con Terraform o Terragrunt:

terragrunt run-all apply

🛠 Contribución

Si deseas contribuir a este proyecto, sigue estos pasos:

Crea un fork del repositorio.

Crea una nueva rama con un nombre descriptivo.

Realiza tus cambios y realiza un commit.

Abre un Pull Request para revisión.

📜 Licencia

Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.




