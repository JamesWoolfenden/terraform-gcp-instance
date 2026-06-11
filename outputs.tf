output "instance_id" {
  description = "The server-assigned unique identifier of the compute instance"
  value       = google_compute_instance.default.instance_id
}

output "instance_name" {
  description = "Name of the compute instance"
  value       = google_compute_instance.default.name
}

output "self_link" {
  description = "The URI of the compute instance"
  value       = google_compute_instance.default.self_link
}

output "internal_ip" {
  description = "Internal IP address of the instance's primary network interface"
  value       = google_compute_instance.default.network_interface[0].network_ip
}
