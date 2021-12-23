module "eks_cluster" {
  source                  = "app.terraform.io/legendary-org/module-eks-cluster/aws"
  version                 = "~> 0.0.1"
  vpc_id                  = var.vpc_id
  public_subnets          = var.public_subnet_ids
  private_subnets         = var.private_subnet_ids
  cluster_name            = "${var.clusters_name}-${terraform.workspace}"
  eks_cluster_k8s_version = var.eks_cluster_k8s_version
  workers_instance_type   = var.workers_instance_type
  workers_ami_id          = data.aws_ssm_parameter.workers_ami_id.value
  workers_number_min      = var.workers_number_min
  workers_number_max      = var.workers_number_max
  workers_storage_size    = var.workers_storage_size
  common_tags             = local.common_tags
  aws_region              = var.aws_region
}

locals {
  common_tags = {
    ManagedBy   = "terraform"
    ClusterName = "${var.clusters_name}-${terraform.workspace}"
  }
}

data "aws_ssm_parameter" "workers_ami_id" {
  name            = "/aws/service/eks/optimized-ami/1.15/amazon-linux-2/recommended/image_id"
  with_decryption = false
}
