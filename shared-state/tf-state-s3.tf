# eks cluster

resource "aws_s3_bucket" "eks_cluster_tf_state_s3_bucket" {

    bucket = "${var.cluster_name}-terraform-state"
    acl    = var.s3_bucket_acl

    versioning {
      enabled = var.s3_versioning
    }

    lifecycle_rule {
      enabled = var.s3_lifecycle
    }

    tags = {
        Name      = var.cluster_env
        ManagedBy = "${var.cluster_name}-Managedby-${var.team_name}"

    }
  
}

#vpc 
resource "aws_s3_bucket" "eks_cluster_vpc_tf_state_s3_bucket" {

    bucket = "${var.cluster_name}-terraform-state"
    acl    = var.s3_bucket_acl

    versioning {
      enabled = var.s3_versioning
    }

    lifecycle_rule {

      enabled = var.s3_lifecycle

    }

    tags = {
        Name           = var.cluster_env
        ManagedBy      = "${var.cluster_name}-Managedby-${var.team_name}"

    }
  
}

