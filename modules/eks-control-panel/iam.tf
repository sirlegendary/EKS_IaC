resource "aws_iam_role" "eks_cluster_learning_role" {
  name = "${var.cluster_name}-cluster"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "eks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
POLICY

}

data "aws_iam_policy" "AmazonEKSClusterPolicy" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

data "aws_iam_policy" "AmazonEKSVPCResourceController" {
  arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

resource "aws_iam_role_policy_attachment" "eks_clusterVPCResourceController_policy_attachment" {
    policy_arn = data.aws_iam_policy.AmazonEKSVPCResourceController.arn
    role = aws_iam_role.eks_cluster_learning_role.name
    depends_on = [data.aws_iam_policy.AmazonEKSVPCResourceController]
}

resource "aws_iam_role_policy_attachment" "eks_clusterrole_policy_attachment" {
    policy_arn = data.aws_iam_policy.AmazonEKSClusterPolicy.arn
    role = aws_iam_role.eks_cluster_learning_role.name
    depends_on = [data.aws_iam_policy.AmazonEKSClusterPolicy]
}