data "google_client_config" "provider" {}


provider kubernetes {
  host  = var.cluster_endpoint
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(var.cluster_ca_cert)
}

provider "helm" {
  kubernetes {
    host  = var.cluster_endpoint
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(var.cluster_ca_cert)
  }
}

resource "helm_release" "release" {
  name             = var.chart_name
  namespace        = var.chart_namespace
  chart            = "${path.module}/charts/${var.chart_name}"
  create_namespace = true
  recreate_pods    = true
  force_update     = true

  values = [
    templatefile("${path.module}/charts/${var.chart_name}/values.yaml.tpl",{
      enabled = true
    })
  ]
}

data "kubernetes_service" "ingress_svc" {
  metadata {
    name = "${var.chart_namespace}-ingress-nginx-controller"
    namespace        = var.chart_namespace
  }
}