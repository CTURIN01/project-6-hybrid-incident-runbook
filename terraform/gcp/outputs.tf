output "gcp_network_id" {
  description = "GCP VPC network ID"
  value       = google_compute_network.main.id
}

output "gcp_subnet_id" {
  description = "GCP subnet ID"
  value       = google_compute_subnetwork.public.id
}
