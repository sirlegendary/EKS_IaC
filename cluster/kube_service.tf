resource "kubernetes_service" "calc_service" {
  metadata {
    name = "calc-service"
  }
  spec {
    selector = {
      App = kubernetes_deployment_v1.calculator.metadata.0.labels.App
    }
    
    port {
      port        = 8080
      target_port = 80
    }

    type = "NodePort"
  }
}