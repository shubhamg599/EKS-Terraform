terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_cidr             = var.vpc_cidr
  availability_zones    = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}
module "eks" {
  source = "../../modules/eks"

  cluster_name    = "Jenkins-CI-CD-demo"
  cluster_version = "1.36"

  subnet_ids = module.vpc.private_subnet_ids
}