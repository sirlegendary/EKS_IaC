resource "kubernetes_deployment_v1" "calculator" {
  metadata {
    name = "calculator"
    labels = {
      App = "calculator"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "calculator"
      }
    }
    template {
      metadata {
        labels = {
          App = "calculator"
        }
      }
      spec {
        container {
          image = "sirlegendary/cryptocalculator"
          name  = "calculator"

          port {
            container_port = 80
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}