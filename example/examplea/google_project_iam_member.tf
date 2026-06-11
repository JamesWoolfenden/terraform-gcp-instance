locals {
  instance_sa_roles = toset([
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/storage.objectViewer",
    "roles/cloudtrace.agent",
    "roles/servicemanagement.serviceController",
  ])
}

resource "google_project_iam_member" "instance_sa" {
  for_each = local.instance_sa_roles
  project  = var.project
  role     = each.value
  member   = "serviceAccount:${google_service_account.instance.email}"
}
