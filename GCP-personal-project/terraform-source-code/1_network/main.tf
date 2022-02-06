#VPC
resource "google_compute_network" "vpc_network" {
    name                       = var.network_name
}

resource "google_compute_subnetwork" "public_subnets" {
    name                       = var.pub_sub_1
    project                    = var.project_id
    network                    = var.network_name
    ip_cidr_range              = "10.0.0.0/24"
}

resource "google_compute_subnetwork" "private_subnets" {
    name                       = var.priv_sub_1
    project                    = var.project_id
    network                    = var.network_name
    ip_cidr_range              = "10.0.2.0/24"
    private_ip_google_access   = true
}

#firewall
resource "google_compute_firewall" "firewall" {
  name    = "bts-default"
  network = google_compute_network.vpc_network.name
  description = "Allow ssh, icmp from bastion vm."

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  target_tags   = ["bastion"]
  source_ranges = ["0.0.0.0/0"]
}

# NAT gateway
resource "google_compute_router" "router" {
  name    = "bts-nat-router"
  region  = var.region
  network = var.network_name

  bgp {
    asn = 64514
  }
}

resource "google_compute_router_nat" "nat" {
  name                               = "bts-nat-config"
  router                             = google_compute_router.router.name
  region                             = google_compute_router.router.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}