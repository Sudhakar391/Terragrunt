provider "aws" {
  region = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

module "eks" {
  source = "../../modules/eks"

  region          = var.region
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  subnets         = var.subnets
  vpc_id          = var.vpc_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_certificate_authority_data" {
  value = module.eks.cluster_certificate_authority_data
}
