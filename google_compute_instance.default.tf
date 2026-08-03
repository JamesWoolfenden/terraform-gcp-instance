resource "google_compute_instance" "this" {
  name                      = var.name
  project                   = var.project
  machine_type              = var.machine_type
  zone                      = var.zone
  tags                      = var.tags
  allow_stopping_for_update = var.allow_stopping_for_update

  boot_disk {
    kms_key_self_link = var.kms_key_self_link

    initialize_params {
      image = var.image
      size  = var.disk_size_gb
      type  = var.disk_type
    }
  }

  network_interface {
    network = var.network
  }

  shielded_instance_config {
    enable_secure_boot = true
    enable_vtpm        = true
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
