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

variable "slave_name" {
  default = "slave-for-jenkins"
}

variable "name" {
    default = "network-interface"
}

variable "network" {
  default = "default"
}

variable "source_ranges" {
    default = ["0.0.0.0/0"]
}

variable "protocol" {
    default = "tcp"
}

variable "ports" {
    default = ["22", "8080", "5000", "50000"]
}

variable "algorithm" {
    default = "ECDSA"  
}

variable "rsa_bits" {
    default = 4096
}

variable "instance_name" {
    type = string
    default = "jenkins-web"
}

variable "ecdsa_curve" {
  default   = "P384"
}

variable "machine_type" {
    default = "n2d-standard-2"
}

variable "tags" {
    default = ["jenkins"]
}

variable "image" {
    default = "ubuntu-minimal-2004-focal-v20211030"
}

#variable "project_name" {
#  description = "Google Cloud Platform (GCP) Project name."
#  type        = string
#  default     = "my-first"
#}
#
#variable "node_machine_type"{
#  description = "Machine type for kubernetes node."
#  type        = string
#  default     = "n2d-standard-2"
#}
