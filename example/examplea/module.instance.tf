module "instance" {
  source      = "../../"
  common_tags = var.common_tags
  name        = "instance-1"
  account_id  = var.account_id
}
