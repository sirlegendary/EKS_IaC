terraform{
    backend "remote"{
    organization = "legendary-org"
      workspaces {
        name = "eks-dev-cluster"
      }
    }
    required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.31.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}