variable "cluster_name" {
    type = string
}

variable "eks_cluster_k8s_version" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}
variable "vpc_id" {
  type = string
}
variable "common_tags" {
  type = map(string)
}