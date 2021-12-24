output "vpc_id" {
  value = module.vpc.application_vpc
}
output "private_subnets" {
  value = module.vpc.application_private_subnets
}
output "public_subnets" {
  value = module.vpc.application_public_subnets
}
output "aws_region" {
  value = var.aws_region
}

output "cluster_full_name" {
  value = "${var.clusters_name}"
}

output "cluster_version" {
  value = var.eks_cluster_k8s_version
}

output "cluster_api" {
  value = module.eks_cluster.cluster_api
}

output "cluster_tag" {
  value = module.eks_cluster.cluster_tag
}

output "worker_iam_role_arn" {
  value = module.eks_cluster.worker_iam_role_arn
}

output "authconfig" {
  value = module.eks_cluster.authconfig
}

output "certificate_authority" {
  value = module.eks.eks_cp_ca
}