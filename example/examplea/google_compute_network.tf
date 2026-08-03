resource "google_compute_network" "instance" {
  name                            = "instance-network"
  auto_create_subnetworks         = false
  project                         = var.project
  delete_default_routes_on_create = true
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

# The instance's service account only needs Google API access (logging,
# monitoring, storage, cloudtrace, servicemanagement -- see
# google_project_iam_member.instance_sa), not general internet egress.
# Route only to restricted.googleapis.com rather than 0.0.0.0/0, which would
# silently restore full internet access that delete_default_routes_on_create
# was meant to remove.
resource "google_compute_route" "restricted_googleapis" {
  name             = "instance-restricted-googleapis"
  dest_range       = "199.36.153.8/30"
  network          = google_compute_network.instance.self_link
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
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

  # Restrict the deny rule to the module's subnet rather than the whole internet
  # Deny from the internet (allowed exceptions can be created with higher-priority allow rules)
  source_ranges = ["0.0.0.0/0"]

  # Enable logging for this firewall rule
  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
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

  log_config {
    metadata = "INCLUDE_ALL_METADATA"
  }
}
