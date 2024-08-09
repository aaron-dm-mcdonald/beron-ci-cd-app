variable "zone" {
  description = "The zone where the cluster will be created"
  type        = string
  default     = "us-central1-a"  
}

variable "project" {
  description = "The GCP project ID"
  type        = string
  default     = "primary-sandbox-project"  
}

variable "machine-type" {
  description = "Machine Type for nodes"
  type        = string
  default     = "n2-standard-8"  
}
