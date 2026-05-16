terraform {
  required_version = ">= 1.5.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}

variable "gcp_project_id" {
  default = "your-gcp-project-id"
}

variable "gcp_region" {
  default = "us-central1"
}

variable "project_name" {
  default = "project-6-hybrid"
}

resource "google_compute_network" "main" {
  name                    = "${var.project_name}-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "public" {
  name          = "${var.project_name}-subnet"
  ip_cidr_range = "10.1.1.0/24"
  region        = var.gcp_region
  network       = google_compute_network.main.id
}

resource "google_compute_firewall" "allow_internal" {
  name    = "${var.project_name}-allow-internal"
  network = google_compute_network.main.name
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "icmp"
  }
  source_ranges = ["10.1.0.0/16"]
}

output "gcp_network_id" {
  value = google_compute_network.main.id
}
