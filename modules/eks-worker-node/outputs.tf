output "asg_names" {
  value = aws_autoscaling_group.eks_learning_cluster_workers_asg.name
}

output "security_group_id" {
  value = aws_security_group.eks_learning_workers_sg.id
}

output "iam_role_arn" {
  value = aws_iam_role.eks_learning_cluster_workers_nodes_role.arn
}

output "iam_role_name" {
  value = aws_iam_role.eks_learning_cluster_workers_nodes_role.name
}

output "tag" {
  value = "kubernetes.io/cluster/${var.cluster_name}"
}

output "instance_profile" {
  value = aws_iam_instance_profile.eks_learning_cluster_workers_profile.arn
}

output "userdata" {
  value = local.workers_userdata
}

output "authconfig" {
  value = local.authconfig
}