variable "gcp_project_id" {
  description = "The ID of the GCP project to use"
}

variable "gcp_region" {
  description = "The GCP region where resources should be created"
  default     = "europe-west2"
}

variable "server_instance_count" {
  description = "The number of server instances to create"
  default     = 3
}

variable "client_instance_count" {
  description = "The number of clientinstances to create"
  default     = 1
}