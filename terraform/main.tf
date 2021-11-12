provider "google" {
project = "sunlit-inn-329918"
region = "europe-west3"
zone = "europe-west3-c"
}

resource "tls_private_key" "keys-for-jenkins" {
  algorithm   = "ECDSA"
  rsa_bits    = "4096"
  ecdsa_curve = "P384"
}

resource "google_compute_firewall" "web-server-for-jenkins" {
name = "webnetwork-interface"
network = "default"
source_ranges = ["0.0.0.0/0"]
allow {
protocol = "tcp"
ports = ["22", "8080", "5000"]
}
}

resource "google_compute_instance" "vm-instance-for-jenkins" {
name = "jenkins-web"
machine_type = "e2-micro"
tags = ["jenkins"]
 metadata = {
ssh-keys ="ubuntu:${tls_private_key.keys-for-jenkins.public_key_openssh}"
}
boot_disk {
 initialize_params{
  image = "debian-10-buster-v20211105"
}
}
network_interface {
network = "default"
access_config{
}
}
provisioner "local-exec"{
command = "echo '${tls_private_key.keys-for-jenkins.private_key_pem}'>./mykey.pem"
}
}

terraform {
  backend "gcs" {
      bucket      = "tf-for-terraform-state-python-flask-app"
      prefix      = "project/terraform.tfstate"
  }
} 
