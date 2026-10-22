output "cluster_endpoint" {
  description = "Endpoint for EKS control plane"
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "Kubernetes cluster name"
  value = module.eks.cluster_name
}

output "configure_kubectl" {
    description = "Command to updaye local kubeconfig"
    value = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
}

output "ecr_repository_url" {
  description = "The URL of the ECR repository"
  value = aws_ecr_repository.app_repo.repository_url  
}