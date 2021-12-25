resource "kubernetes_config_map_v1" "auth_config" {
  metadata {
    name = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    #   mapRoles = {
          rolearn  = module.eks_cluster.worker_iam_role_arn
          username = "system:node:{{EC2PrivateDNSName}}"
        #   groups   = {
        #         system = "bootstrappers",
        #         system = "nodes"
        #     }
    #   }
  }

}