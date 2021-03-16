resource "google_compute_instance" "default" {
  #checkov:skip=CKV_GCP_38:gcp encrypted by default
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone


  boot_disk {
    initialize_params {
      image = var.image
    }
  }

  labels = var.labels

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  shielded_instance_config {
    enable_secure_boot = true
  }

  metadata = var.metadata

  metadata_startup_script = var.metadata_startup_script

  service_account {
    email = data.google_service_account.default.email
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
    "https://www.googleapis.com/auth/trace.append"]
  }

}

variable "labels" {
  default = { "jim" = "a" }
}
