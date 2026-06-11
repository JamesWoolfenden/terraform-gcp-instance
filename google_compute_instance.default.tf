resource "google_compute_instance" "default" {
  name         = var.name
  machine_type = var.machine_type
  zone         = var.zone


  boot_disk {
    kms_key_self_link = var.kms_key_self_link

    initialize_params {
      image = var.image
    }
  }

  network_interface {
    network = var.network
  }

  shielded_instance_config {
    enable_secure_boot = true
  }

  metadata = {
    block-project-ssh-keys = true
    enable-oslogin         = "TRUE"
  }
  metadata_startup_script = var.metadata_startup_script

  service_account {
    email = data.google_service_account.default.email
    scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }

}
