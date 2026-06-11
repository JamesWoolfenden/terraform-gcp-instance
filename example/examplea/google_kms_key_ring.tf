resource "google_kms_key_ring" "instance" {
  name     = "instance-keyring"
  location = var.region
  project  = var.project
}
