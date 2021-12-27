resource "kubernetes_config_map_v1" "auth_config" {
  metadata {
    name = "aws-auth"
    namespace = "kube-system"
  }
  data = {
    api_host = module.eks_cluster.cluster_api
        mapRoles =<<YAML
          - rolearn: ${module.eks_cluster.worker_iam_role_arn}
            username: system:node:{{EC2PrivateDNSName}}
            groups:
              - system:bootstrappers
              - system:nodes
        YAML
  }
  depends_on = [ module.eks_cluster.cluster_api ]
}