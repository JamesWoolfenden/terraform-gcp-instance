resource "google_compute_network" "instance" {
  name                    = "instance-network"
  auto_create_subnetworks = false
  project                 = var.project
}

resource "google_compute_subnetwork" "instance" {
  name                     = "instance-subnet"
  ip_cidr_range            = "10.0.0.0/24"
  region                   = var.region
  network                  = google_compute_network.instance.id
  project                  = var.project
  private_ip_google_access = true

  log_config {
    aggregation_interval = "INTERVAL_10_MIN"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

resource "google_compute_firewall" "deny_ingress" {
  name      = "instance-network-deny-ingress"
  network   = google_compute_network.instance.self_link
  project   = var.project
  direction = "INGRESS"
  priority  = 65534

  deny {
    protocol = "all"
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_iap_ssh" {
  name      = "instance-network-allow-iap-ssh"
  network   = google_compute_network.instance.self_link
  project   = var.project
  direction = "INGRESS"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["35.235.240.0/20"]
}
