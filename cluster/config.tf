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

provider "kubernetes" {
  host                   = module.eks_cluster.cluster_api
  cluster_ca_certificate = base64decode(module.eks.eks_cp_ca)
  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      var.clusters_name
    ]
  }
}