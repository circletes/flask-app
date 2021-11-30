resource "tls_private_key" "keys-for-jenkins" {
  algorithm   = var.algorithm //EDCA
  rsa_bits    = var.rsa_bits //4096
  ecdsa_curve = var.ecdsa_curve //"P384"
}


resource "google_compute_instance" "vm-instance-for-jenkins" {
project = var.project_id
name = var.instance_name //"jenkins-web"
machine_type = var.machine_type //"n2d-standard-2"
tags = var.tags //["jenkins"]
 metadata = {
ssh-keys ="ubuntu:${tls_private_key.keys-for-jenkins.public_key_openssh}"
}
boot_disk {
 initialize_params{
  image = var.image //"ubuntu-minimal-2004-focal-v20211030"
}
}
network_interface {
network = var.network_name//"[${var.network_name}-public-subnet] [${var.network_name}-private-subnet]"
subnetwork = "private"
#access_config{
#}
}
provisioner "local-exec"{
command = "echo '${tls_private_key.keys-for-jenkins.private_key_pem}'>./mykey.pem"
}
}

resource "google_compute_instance" "vm-instance-for-slave" {
project = var.project_id
name = var.slave_name //"jenkins-web"
machine_type = var.machine_type //"n2d-standard-2"
tags = var.tags //["jenkins"]
 metadata = {
ssh-keys ="ubuntu:${tls_private_key.keys-for-jenkins.public_key_openssh}"
}
boot_disk {
 initialize_params{
  image = var.image //"ubuntu-minimal-2004-focal-v20211030"
}
}
network_interface {
network = var.network_name//"[${var.network_name}-public-subnet] [${var.network_name}-private-subnet]"
subnetwork = "private"
#access_config{
#}
}
provisioner "local-exec"{
command = "echo '${tls_private_key.keys-for-jenkins.private_key_pem}'>./slave.pem"
}
}
resource "google_compute_network" "default" {
  name = "my-network"
}


resource "google_compute_instance" "vm-instance-for-apache" {
project = var.project_id
name = var.apache_name //"jenkins-web"
machine_type = var.machine_type //"n2d-standard-2"
tags = var.tags //["jenkins"]
 metadata = {
ssh-keys ="ubuntu:${tls_private_key.keys-for-jenkins.public_key_openssh}"
}
boot_disk {
 initialize_params{
  image = var.image //"ubuntu-minimal-2004-focal-v20211030"
}
}
network_interface {
network = var.network_name//"[${var.network_name}-public-subnet] [${var.network_name}-private-subnet]"
subnetwork = "public"
access_config{
}
}
provisioner "local-exec"{
command = "echo '${tls_private_key.keys-for-jenkins.private_key_pem}'>./apache.pem"
}
}