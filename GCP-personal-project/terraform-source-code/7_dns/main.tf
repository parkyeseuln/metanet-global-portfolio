data "google_compute_global_address" "global_address" {
  name = var.ingress_ip
}

resource "google_dns_managed_zone" "primary" {
  name        = var.dns_zone
  dns_name    = var.dns_name
  description = "dns for web server"
}

resource "google_dns_record_set" "a_hybrid" {
  name = google_dns_managed_zone.primary.dns_name
  type = "A"
  ttl  = 300

  managed_zone = google_dns_managed_zone.primary.name

  rrdatas = [data.google_compute_global_address.global_address.address]
}

resource "google_dns_record_set" "cname_hybrid" {
  name = "www.${google_dns_managed_zone.primary.dns_name}"
  type = "CNAME"
  ttl  = 300

  managed_zone = google_dns_managed_zone.primary.name

  rrdatas = [google_dns_managed_zone.primary.dns_name]
}

resource "google_dns_record_set" "cname_review" {
  name = "review.${google_dns_managed_zone.primary.dns_name}"
  type = "CNAME"
  ttl  = 300

  managed_zone = google_dns_managed_zone.primary.name

  rrdatas = [google_dns_managed_zone.primary.dns_name]
}