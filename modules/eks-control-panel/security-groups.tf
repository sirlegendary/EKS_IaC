resource "aws_security_group" "eks_cluster_learning_control_panel_sg" {
    name    = "${var.cluster_name}-cluster"
    description = "EKS Cluster Security Group"
    vpc_id =   var.vpc_id 
    tags = {
      "Name" = "${var.cluster_name}-cluster-sg"
      "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
}