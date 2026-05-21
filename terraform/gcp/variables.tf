variable "gcp_project_id" {
  description = "GCP project ID"
  type        = string
  default     = "your-gcp-project-id"
}

variable "gcp_region" {
  description = "GCP region to deploy resources"
  type        = string
  default     = "us-central1"
}

variable "project_name" {
  description = "Project name used for labeling"
  type        = string
  default     = "project-6-hybrid"
}
