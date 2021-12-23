variable "eks_cluster_vpc_block" {
  type = string
}

variable "cluster_name" {
  type = string
}

variable "eks_cluster_private_subnets_ip_lists" {
  type = list(string)
}

variable "eks_cluster_public_subnets_ip_lists" {
  type = list(string)
}
