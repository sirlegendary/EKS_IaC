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

variable "aws_region" {
  type = string
}

variable "region" {
  type = string
  default = "us-east-1"
}