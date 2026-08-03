variable "scopes" {
  type        = list(string)
  description = "OAuth scopes granted to the instance service account"
  default = [
    "https://www.googleapis.com/auth/devstorage.read_only",
    "https://www.googleapis.com/auth/logging.write",
    "https://www.googleapis.com/auth/monitoring.write",
    "https://www.googleapis.com/auth/service.management.readonly",
    "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append",
  ]
  validation {
    condition     = length(var.scopes) > 0
    error_message = "scopes must contain at least one OAuth scope."
  }
}

variable "service_account_email" {
  type        = string
  description = "Email of the service account to attach to the instance; typically an output from a service account module"
  validation {
    condition     = can(regex("^.+@.+\\.iam\\.gserviceaccount\\.com$", var.service_account_email))
    error_message = "service_account_email must be a valid GCP service account email ending in .iam.gserviceaccount.com."
  }
}

variable "image" {
  type        = string
  default     = "debian-cloud/debian-12"
  description = "Boot disk image for the compute instance; must be a supported, non-EOL image family"
  validation {
    condition     = length(trimspace(var.image)) > 0
    error_message = "image must not be empty."
  }
}

variable "kms_key_self_link" {
  type        = string
  description = "Self-link of the KMS CryptoKey used to encrypt the boot disk"
  sensitive   = true
  validation {
    condition     = length(trimspace(var.kms_key_self_link)) > 0
    error_message = "kms_key_self_link must not be empty."
  }
}

variable "machine_type" {
  type        = string
  default     = "e2-medium"
  description = "Machine type for the compute instance"
  validation {
    condition     = length(trimspace(var.machine_type)) > 0
    error_message = "machine_type must not be empty."
  }
}

variable "metadata_startup_script" {
  type        = string
  default     = ""
  description = "Shell script to run on instance boot; runs as root with the instance service account credentials. Leave empty to disable."
  validation {
    condition     = var.metadata_startup_script == "" || length(trimspace(var.metadata_startup_script)) > 0
    error_message = "metadata_startup_script must be empty or a non-whitespace string."
  }
}

variable "name" {
  type        = string
  default     = "instance-1"
  description = "Name of the compute instance"
  validation {
    condition     = can(regex("^[a-z]([-a-z0-9]*[a-z0-9])?$", var.name))
    error_message = "name must start with a lowercase letter, contain only lowercase letters, digits, and hyphens, and not end with a hyphen."
  }
}

variable "network" {
  type        = string
  description = "Self-link or name of the VPC network to attach the instance to"
  validation {
    condition     = length(trimspace(var.network)) > 0
    error_message = "network must not be empty."
  }
}

variable "zone" {
  type        = string
  default     = "us-central1-a"
  description = "Zone in which to create the compute instance"
  validation {
    condition     = can(regex("^[a-z]+-[a-z0-9]+-[a-z]$", var.zone))
    error_message = "zone must be a valid GCP zone in the format region-zone (e.g. us-central1-a)."
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

variable "allow_stopping_for_update" {
  type        = bool
  default     = true
  description = "Allow Terraform to stop the instance to apply updates (e.g. machine_type changes) instead of failing the apply"
}

variable "disk_size_gb" {
  type        = number
  default     = null
  description = "Boot disk size in GB; null uses the source image's default size"
  validation {
    condition     = var.disk_size_gb == null || var.disk_size_gb > 0
    error_message = "disk_size_gb must be null or a positive number."
  }
}

variable "disk_type" {
  type        = string
  default     = null
  description = "Boot disk type (e.g. pd-balanced, pd-ssd); null uses the API default (pd-standard)"
  validation {
    condition     = var.disk_type == null || contains(["pd-standard", "pd-balanced", "pd-ssd", "pd-extreme"], var.disk_type)
    error_message = "disk_type must be null or one of: pd-standard, pd-balanced, pd-ssd, pd-extreme."
  }
}

variable "tags" {
  type        = list(string)
  default     = []
  description = "Network tags to attach to the instance, for firewall rule targeting"
  validation {
    condition     = alltrue([for t in var.tags : can(regex("^[a-z]([-a-z0-9]*[a-z0-9])?$", t))])
    error_message = "each tag must start with a lowercase letter, contain only lowercase letters, digits, and hyphens, and not end with a hyphen."
  }
}
