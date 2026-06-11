data "google_compute_network" "instance" {
  name    = var.network
  project = var.project
}
