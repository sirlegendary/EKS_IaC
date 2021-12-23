resource "aws_eks_cluster" "eks_cluster_learning" {
  name = var.cluster_name
  version = var.eks_cluster_k8s_version
  role_arn = aws_iam_role.eks_cluster_learning_role.arn

  vpc_config {
    security_group_ids  = [aws_security_group.eks_cluster_learning_control_panel_sg.id]
    subnet_ids = concat(var.private_subnets, var.public_subnets)
  }
  depends_on =[
      aws_iam_role_policy_attachment.eks_clusterVPCResourceController_policy_attachment,
      aws_iam_role_policy_attachment.eks_clusterrole_policy_attachment
  ]
}