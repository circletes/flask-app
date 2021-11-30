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

resource "google_compute_router" "router" {
name = "router"
network = google_compute_network.network.id
bgp {
asn = 64514
advertise_mode = "CUSTOM"
}
}
resource "google_compute_router_nat" "nat" {
name = "nat"
router = google_compute_router.router.name
region = google_compute_router.router.region
nat_ip_allocate_option = "AUTO_ONLY"
source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"



subnetwork {
name = "${var.network_name}-private-subnet"
source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
}
}