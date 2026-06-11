# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "instance" {
  source            = "../../"
  name              = "instance-1"
  account_id        = var.account_id
  kms_key_self_link = google_kms_crypto_key.instance.id
  network           = data.google_compute_network.default.self_link
}
