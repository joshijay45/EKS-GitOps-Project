resource "aws_security_group" "app_sg" {
  name = "${var.project_name}-sg"
  description = "Additional security group for worker nodes"
  vpc_id = module.vpc.vpc_id

  ingress {
    description = "Allow inbound traffic from ALB to pods"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = [ var.vpc_cidr ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    Environmet = var.aws_region
  }
}