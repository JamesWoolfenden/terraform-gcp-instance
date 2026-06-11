output "instance_id" {
  description = "The server-assigned unique identifier of the compute instance"
  value       = module.instance.instance_id
}

output "self_link" {
  description = "The URI of the compute instance"
  value       = module.instance.self_link
}
