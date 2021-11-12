variable "project_id" {
  description = "Google Cloud Platform (GCP) Project ID."
  type        = string
  default     = "sunlit-inn-329918"
}

variable "region" {
  description = "GCP region name."
  type        = string
  default     = "europe-west3"
}

variable "zone" {
  description = "GCP zone name."
  type        = string
  default     = "europe-west3-c"
}

variable "name" {
  description = "The name of the bucket."
  type        = string
  default     = "tf-for-terraform-state-python-flask-app"
}

variable "versioning" {
  description = "While set to true, versioning is fully enabled for this bucket."
  type        = bool
  default     = true
}
