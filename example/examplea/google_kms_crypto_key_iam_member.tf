data "google_project" "this" {
  project_id = var.project
}

locals {
  gce_service_agent = "serviceAccount:service-${data.google_project.this.number}@compute-system.iam.gserviceaccount.com"
}

resource "google_kms_crypto_key_iam_member" "compute_encrypter_decrypter" {
  crypto_key_id = google_kms_crypto_key.instance.id
  role          = "roles/cloudkms.cryptoKeyEncrypterDecrypter"
  member        = local.gce_service_agent
}
