terraform{
    
    backend "s3"{
        bucket   = "eksdevelopment-cluster-terraform-state"
        key      = "eksdevelopment-cluster.tfstate"
        region   = "us-east-1" 
        dynamodb_table  = "eksdevelopment-cluster-terraform-state-lock"
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
    profile = "default"
}