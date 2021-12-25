resource "kubernetes_config_map_v1" "auth_config" {
  metadata {
    name = "aws-auth"
    namespace = "kube-system"
  }
  data = {
    mapRoles = [
        {
            rolearn  = module.eks_cluster.worker_iam_role_arn
            username = "system:node:{{EC2PrivateDNSName}}"
            groups   = ["system:bootstrappers", "system:nodes"]
        },
    ]
    # mapUsers    = yamlencode(var.map_users)
    # mapAccounts = yamlencode(var.map_accounts)
  }

#   depends_on = [data.http.wait_for_cluster[0]]

}