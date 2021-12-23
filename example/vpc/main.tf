
module "vpc" {
  source                                = "../../modules/eks-vpc"
  cluster_name                          = var.cluster_name
  eks_cluster_vpc_block                 = var.eks_cluster_vpc_block
  eks_cluster_public_subnets_ip_lists   = var.eks_cluster_public_subnets_ip_lists 
  eks_cluster_private_subnets_ip_lists  = var.eks_cluster_private_subnets_ip_lists
}