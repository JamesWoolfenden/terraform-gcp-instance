variable "account_id" {
  type        = string
  description = "Account ID of the service account to attach to the instance"
  validation {
    condition     = length(trimspace(var.account_id)) > 0
    error_message = "account_id must not be empty."
  }
}

variable "project" {
  type        = string
  description = "GCP project ID"
  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "project must not be empty."
  }
}

variable "region" {
  type        = string
  description = "GCP region for the KMS key ring"
  default     = "us-central1"
  validation {
    condition     = can(regex("^[a-z]+-[a-z0-9]+$", var.region))
    error_message = "region must be a valid GCP region (e.g. us-central1)."
  }
}
