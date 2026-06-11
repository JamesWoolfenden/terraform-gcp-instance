# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "instance" {
  source                = "../../"
  name                  = "instance-1"
  service_account_email = google_service_account.instance.email
  kms_key_self_link     = google_kms_crypto_key.instance.id
  network               = google_compute_network.instance.self_link
  project               = var.project
}
