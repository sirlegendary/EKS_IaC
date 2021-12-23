output "eks_cp_security_group" {
  value   = aws_security_group.eks_cluster_learning_control_panel_sg.id 
}

output "eks_cp_ca" {
  value = aws_eks_cluster.eks_cluster_learning.certificate_authority[0].data
}

output "eks_cp_endpoint" {
  value = aws_eks_cluster.eks_cluster_learning.endpoint
}