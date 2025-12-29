CI/CD Pipeline on AWS EKS using Jenkins & Terraform

Built a complete DevOps pipeline for a microservices-based voting application.

🔹 Infrastructure provisioning using Terraform.
🔹 Dockerized Vote & Result services.
🔹 Jenkins pipeline for build, test, and deployment.
🔹 Kubernetes deployment on AWS EKS.
🔹 GitHub-based workflow with automated image tagging.

Hands-on Project

• Automated application deployment using Jenkins CI/CD pipelines.
• Managed Kubernetes deployments on AWS EKS.
• Implemented Infrastructure as Code with Terraform.
• Improved deployment reliability and reduced manual intervention.

Technologies Used

Cloud: AWS (EC2, EKS, IAM, VPC).
IaC: Terraform.
CI/CD: Jenkins.
Containerization: Docker.
Orchestration: Kubernetes (EKS).
Version Control: GitHub & DockerHub.
OS & Scripting: Linux, Bash.

CI/CD Pipeline Workflow

Code Push to GitHub
Jenkins checks out the code.
Docker images are built for Vote & Result services.
Images are tagged using Git commit ID.
Images are pushed to DockerHub/ECR.
Jenkins updates Kubernetes deployments dynamically.
Applications are deployed to AWS EKS.

Kubernetes Deployment

Uses Deployments and Services.
Image tags are injected via Jenkins (not hardcoded).
ConfigMaps and Secrets are used for databases, users and passwords.
Applications are exposed using Kubernetes Services like LoadBalancer.

I built a complete CI/CD pipeline where Terraform creates AWS infrastructure, Jenkins builds Docker images using commit IDs, pushes them to a registry, and deploys Vote and Result microservices on AWS EKS using Kubernetes.
