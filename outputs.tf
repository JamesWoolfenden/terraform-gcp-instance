output "instance_id" {
  description = "The server-assigned unique identifier of the compute instance"
  value       = google_compute_instance.this.instance_id
}

output "instance_name" {
  description = "Name of the compute instance"
  value       = google_compute_instance.this.name
}

output "self_link" {
  description = "The URI of the compute instance"
  value       = google_compute_instance.this.self_link
}

output "internal_ip" {
  description = "Internal IP address of the instance's primary network interface"
  value       = google_compute_instance.this.network_interface[0].network_ip
}
