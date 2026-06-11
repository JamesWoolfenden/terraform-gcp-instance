resource "google_compute_instance" "default" {
  name         = var.name
  project      = var.project
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
    email  = var.service_account_email
    scopes = var.scopes
  }

}
