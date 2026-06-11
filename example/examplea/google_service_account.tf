resource "google_service_account" "instance" {
  account_id   = "instance-sa"
  display_name = "Service account for compute instance"
  project      = var.project
}
