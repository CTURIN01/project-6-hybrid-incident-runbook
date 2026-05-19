output "gcp_network_id" {
  description = "The GCP VPC network ID"
  value       = google_compute_network.main.id
}

output "gcp_subnet_id" {
  description = "The GCP subnetwork ID"
  value       = google_compute_subnetwork.public.id
}
