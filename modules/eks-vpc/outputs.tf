output "eks_cluster_vpc" {
  value = aws_vpc.eks_cluster_vpc.id
}

output "eks_cluster_private_subnets" {
  value = aws_subnet.eks_cluster_private_subnets.*.id
}

output "eks_cluster_public_subnets" {
  value = aws_subnet.eks_cluster_public_subnets.*.id
}

output "eks_cluster_eip" {
  value = aws_eip.eks_cluster_eip.*.public_ip
}