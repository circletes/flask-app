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
  apache_name = var.apache_name
  depends_on = [module.firewall]
}

#module "cluster" {
#  source                = "./modules/k8s-cluster/"
#  region                = var.region
#  project_id            = var.project_id
#  cluster_name          = "${var.project_name}-cluster"
#  cluster_nodepool_name = "${var.project_name}-nodepool"
#  network               = var.network
##  subnetwork            = module.network.subnetwork_name
#  machine_type          = var.node_machine_type
#}