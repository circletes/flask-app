provider "google" {
  project     = var.project_id
  region      = var.region
  zone        = var.zone
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
  image = var.image
  network = var.network
  algorithm = var.algorithm
  rsa_bits = var.rsa_bits
  depends_on = [module.firewall]
}