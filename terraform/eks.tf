module "eks" {
  source = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name = "${var.project_name}-cluster"
  cluster_version = var.cluster_version
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_groups = {
    default = {
        min_size = 1
        max_size = 2
        desired_size = 1

        instance_types = ["t2.small"]
        capacity_type = "ON_DEMAND"
        version = var.cluster_version

        vpc_security_group_ids = [aws_security_group.app_sg.id]
    }
  }
}