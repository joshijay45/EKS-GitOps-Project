variable "aws_region" {
    description = "AWS region where resources will be deployed"
    type = string
    default = "us-east-1"
}

variable "project_name" {
    description = "Simple Flask Application"
    type = string
    default = "simple-flask-app"
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type = string
    default = "10.0.0.0/16"
}

variable "availability_zones" {
    description = "List of availability Zones"
    type = list(string)
    default = ["us-east-1a", "us-east-1b"]
}

variable "public_subnets" {
  description = "CIDR blocks for public subnets"
  type = list(string)
  default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "private_subnets" {
 description = "CIDR blocks for private subnets"
 type = list(string)
 default = [ "10.0.3.0/24", "10.0.4.0/24" ]
} 

variable "cluster_version" {
    description = "Kubernetes version for EKS"
    type = string
    default = "1.31"
}