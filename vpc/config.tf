terraform{
    backend "remote"{
    organization = "legendary-org"
      workspaces {
        name = "vpc-dev-eks"
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
  region = "us-east-1"
}