resource "google_kms_crypto_key" "instance" {
  name            = "instance-key"
  key_ring        = google_kms_key_ring.instance.id
  rotation_period = "7776000s"

  lifecycle {
    prevent_destroy = true
  }
}
