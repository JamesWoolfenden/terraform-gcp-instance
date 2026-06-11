data "google_project" "this" {
  project_id = var.project
}

resource "google_kms_crypto_key_iam_member" "compute_encrypter_decrypter" {
  crypto_key_id = google_kms_crypto_key.instance.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = "serviceAccount:service-${data.google_project.this.number}@compute-system.iam.gserviceaccount.com"
}
