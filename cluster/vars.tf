variable "aws_region" {
  type = string
}

variable "clusters_name" {
  type = string
}

variable "eks_cluster_k8s_version" {
  type = string
}

variable "workers_storage_size" {
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

variable "application_vpc_block" {
  type = string
}

variable "application_name" {
  type = string
}

variable "application_private_subnets_ip_lists" {
  type = list(string)
}

variable "application_public_subnets_ip_lists" {
  type = list(string)
}