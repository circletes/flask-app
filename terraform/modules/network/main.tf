resource "google_compute_network" "network" {
  name                    = var.network_name
  project                 = var.project_id
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "private-subnet" {
  name          = "${var.network_name}-private-subnet"
  region        = var.region
  network       = google_compute_network.network.name
  ip_cidr_range = "192.168.0.0/24" 
  depends_on    = [google_compute_network.network]
}

resource "google_compute_subnetwork" "pub-subnet" {
     name          = "${var.network_name}-public-subnet"
     ip_cidr_range = "172.17.0.0/16"
     network       = google_compute_network.network.name
     region        = var.region
     depends_on    = [google_compute_network.network]
    }