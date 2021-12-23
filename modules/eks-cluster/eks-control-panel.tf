module "eks" {
  source            = "../eks-control-panel"
  vpc_id            = var.vpc_id
  private_subnets   = var.private_subnets
  public_subnets    = var.public_subnets
  cluster_name      = var.cluster_name
  eks_cluster_k8s_version   = var.eks_cluster_k8s_version
  common_tags       = var.common_tags
}