provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
  credentials = file("credentials.json")
}

module "firewall" {
  source          = "./modules/firewall/"
  project_id = var.project_id
  name = var.name
  network = var.network
  source_ranges = var.source_ranges
  protocol = var.protocol
  ports = var.ports
}

module "instances" {
  source          = "./modules/instances/"
  project_id = var.project_id
  instance_name = var.instance_name
  slave_name = var.slave_name
  ecdsa_curve = var.ecdsa_curve
  machine_type = var.machine_type
  tags = var.tags
  project_name = var.project_name
  image = var.image
  network = var.network
  algorithm = var.algorithm
  rsa_bits = var.rsa_bits
  network_name    = "${var.project_name}-vpc-${terraform.workspace}"
  apache_name = var.apache_name
  depends_on = [module.firewall]
}

module "network" {
  source          = "./modules/network/"
  region          = var.region
  project_name    = var.project_name
  project_id      = var.project_id
  network_name    = "${var.project_name}-vpc-${terraform.workspace}"
}