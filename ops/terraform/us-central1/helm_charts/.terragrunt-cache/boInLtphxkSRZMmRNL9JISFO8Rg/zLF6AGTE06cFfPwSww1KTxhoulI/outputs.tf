output "context" {
  description = "Output of module"
  value = helm_release.release
  sensitive = true
}


output "ingress_ip" {
  description = "Ingress Ip"
  value = data.kubernetes_service.ingress_svc.status.0.load_balancer.0.ingress.0.ip
}