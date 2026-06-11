variable "network" {
  type        = string
  description = "Name of the VPC network to attach the instance to; must not be the default network"
  validation {
    condition     = var.network != "default"
    error_message = "network must not be the GCP default VPC network."
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
