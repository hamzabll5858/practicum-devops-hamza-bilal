output "cluster_id" {
  description = "Cluster ID"
  value = google_container_cluster.primary.id
}

output "cluster_ca_cert" {
  description = "Cluster CA certs ID"
  value = google_container_cluster.primary.master_auth.0.cluster_ca_certificate
  sensitive = true
}

output "cluster_endpoint" {
  description = "Cluster endpoint"
  value = google_container_cluster.primary.endpoint
  sensitive = true
}