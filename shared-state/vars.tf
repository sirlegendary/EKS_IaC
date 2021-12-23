variable "s3_bucket_acl" {
  type = string
}

variable "cluster_env" {
  type = string
}

variable "cluster_vpc_hash_key" {
  type = string
}

variable "cluster_vpc_rc" {
  type = number
}

variable "cluster_vpc_wc" {
  type = number
}

variable "cluster_name" {
    type = string
}

variable "cluster_rc" {
  type = number
}

variable "cluster_wc" {
  type = number
}

variable "cluster_hash_key" {
  type = string
}

variable "s3_versioning" {
  type = bool
}



variable "team_name" {
  type = string
}

variable "s3_lifecycle" {
  type = bool
}

variable "aws_region" {
  type = string
}