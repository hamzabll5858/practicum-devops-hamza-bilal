resource "google_dns_managed_zone" "assessment-zone" {
  name        = "assessment-zone"
  dns_name    = "reliabilitybots.com."
  description = "DNS zone GCP"
}

resource "google_dns_record_set" "frontend" {
  name = "learning.${google_dns_managed_zone.assessment-zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.assessment-zone.name

  rrdatas = [var.ingress_ip]
}

resource "google_dns_record_set" "monitoring" {
  name = "monitoring.${google_dns_managed_zone.assessment-zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.assessment-zone.name

  rrdatas = [var.ingress_ip]
}