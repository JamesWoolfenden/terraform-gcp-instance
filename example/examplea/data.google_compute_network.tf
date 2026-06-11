data "google_compute_network" "default" {
  name    = "default"
  project = var.project
}
