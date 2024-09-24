variable "region" {
  description = "AWS region"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
}

variable "subnets" {
  description = "Subnets for EKS"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for EKS"
  type        = string
}
