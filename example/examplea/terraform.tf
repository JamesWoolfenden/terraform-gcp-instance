# holden:ignore:HLD_TF_004 — examples use local state; remote backend is the caller's responsibility
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "7.30.0"
    }
  }
  required_version = ">= 1.5.0"
}
