# EKS & GitOps Infrastructure Pipeline

What is this project?

Architected an automated GitOps & CI/CD deployment pipeline to deploy, manage, and synchronize a Python Flask web application on an AWS Elastic Kubernetes Service (EKS) cluster. Instead of manually applying Kubernetes manifests or managing deployments directly on nodes, this pipeline uses infrastructure-as-code and GitOps principles to automatically mirror application updates from GitHub directly to the cluster in real time.

Everything is provisioned using Terraform, built with GitHub Actions, and synchronized via ArgoCD.

# How It Works

The Continuous Integration (CI) Pipeline :

The Problem: Manually building Docker images, tagging them, and uploading them to container registries is prone to human error and slows down software delivery.

The Trigger: A developer pushes new code or configuration changes to the main branch of this GitHub repository.

The Action: GitHub Actions triggers an automated workflow that checks out the repository, authenticates with AWS, builds the application Docker container image, and pushes it to Amazon Elastic Container Registry (ECR).

# The GitOps Deployment Engine :

The Problem: Direct cluster deployments using kubectl from local machines lead to configuration drift and security risks.

The Trigger: ArgoCD continuously monitors the k8s/ directory in the GitHub repository for updates or state changes.

The Action: The ArgoCD controller running inside the EKS cluster compares the live cluster state with the target state in Git. If changes are detected, ArgoCD automatically syncs and deploys the updated Kubernetes Deployment and Service manifests to the default namespace.

# Tech Stack Used

Infrastructure as Code: Terraform

Continuous Integration: GitHub Actions

GitOps Delivery: ArgoCD

Containerization & Orchestration: Docker, Amazon EKS (Kubernetes), Amazon ECR

Application: Python 3 (Flask Framework)

# How to Deploy

Clone this repository:

git clone https://github.com/joshijay45/EKS-GitOps-Project.git
cd EKS-GitOps-Project


# Provision the AWS infrastructure with Terraform:

cd terraform
terraform init
terraform apply -auto-approve


Update your local Kubernetes context:

aws eks update-kubeconfig --region us-east-1 --name simple-eks-proj-cluster


# Install ArgoCD and apply the GitOps application manifest:

kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/master/manifests/crds/application-crd.yaml
kubectl apply -f k8s/argocd-application.yaml --validate=false


Configure GitHub Secrets (AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY, AWS_REGION, ECR_REPOSITORY) in your repository settings to enable the CI pipeline.

To test: Forward local traffic to the application service and view your running app:

kubectl port-forward svc/simple-app-service 8080:80 -n default
