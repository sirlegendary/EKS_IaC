output "aws_region" {
  value = var.aws_region
}

output "cluster_full_name" {
  value = "${var.clusters_name}-${terraform.workspace}"
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