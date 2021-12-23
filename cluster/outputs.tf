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
  value = module.ekslearningcluster.cluster_api
}

output "cluster_tag" {
  value = module.ekslearningcluster.cluster_tag
}

output "worker_iam_role_arn" {
  value = module.ekslearningcluster.worker_iam_role_arn
}

output "authconfig" {
  value = module.ekslearningcluster.authconfig
}