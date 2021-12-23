variable "vpc_id" {
  type = string
}

variable "private_subnets" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "cluster_name" {
  type = string
}

variable "eks_cluster_k8s_version" {
  type = string
}

variable "workers_ami_id" {
  type = string
}

variable "workers_instance_type" {
  type = string
}

variable "workers_number_min" {
  type = string
}

variable "workers_number_max" {
  type = string
}

variable "workers_storage_size" {
  type = string
}

variable "common_tags" {
  type = map(string)
}

variable "aws_region" {
  type = string
}