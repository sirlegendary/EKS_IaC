output "vpc_id" {
  value = module.vpc.eks_cluster_vpc
}
output "private_subnets" {
  value = module.vpc.eks_cluster_private_subnets
}
output "public_subnets" {
  value = module.vpc.eks_cluster_public_subnets
}