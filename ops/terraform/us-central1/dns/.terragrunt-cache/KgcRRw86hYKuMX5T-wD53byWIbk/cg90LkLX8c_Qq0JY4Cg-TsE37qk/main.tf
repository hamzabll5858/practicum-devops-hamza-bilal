resource "google_dns_managed_zone" "assessment-zone" {
  name        = "assessment-zone"
  dns_name    = "reliabilitybots.com."
  description = "DNS zone"
}

resource "google_dns_record_set" "frontend" {
  name = "learning.${google_dns_managed_zone.assessment-zone.dns_name}"
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.assessment-zone.name

  rrdatas = [var.ingress_ip]
}