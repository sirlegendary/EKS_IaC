locals {
  authconfig = <<AUTHCONFIG
apiVersion: v1
kind: ConfigMap
metadata:
  name: aws-auth
  namespace: kube-system
data:
  mapRoles: |
    - rolearn: "${aws_iam_role.eks_learning_cluster_workers_nodes_role.arn}"
      username: system:node:{{EC2PrivateDNSName}}
      groups:
        - system:bootstrappers
        - system:nodes
AUTHCONFIG
}