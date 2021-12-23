resource "aws_dynamodb_table" "eks_cluster_tf_state_dynamodb_table" {
    depends_on     = [aws_s3_bucket.eks_cluster_tf_state_s3_bucket]
    name           = "${var.cluster_name}-terraform-state-lock"
    hash_key       = var.cluster_hash_key
    read_capacity  = var.cluster_rc
    write_capacity = var.cluster_wc

    attribute {
      name = var.cluster_hash_key
      type = "S"
    }
  
}

resource "aws_dynamodb_table" "eks_cluster_vpc_tf_state_dynamodb_table" {
    depends_on     = [aws_s3_bucket.eks_cluster_vpc_tf_state_s3_bucket]
    name           = "${var.cluster_name}-vpc-terraform-state-lock"
    hash_key       = var.cluster_vpc_hash_key
    read_capacity  = var.cluster_vpc_rc
    write_capacity = var.cluster_vpc_wc

    attribute {
      name = var.cluster_vpc_hash_key
      type = "S"
    }
  
}