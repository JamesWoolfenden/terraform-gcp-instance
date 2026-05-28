# holden:ignore:HLD_TF_026 — examples intentionally use ../../ to reference the local module root
module "instance" {
  source      = "../../"
  common_tags = var.common_tags
  name        = "instance-1"
  account_id  = var.account_id
}
