resource "google_compute_firewall" "web-server-for-jenkins" {
name = var.name 
network = var.network //default
source_ranges =  var.source_ranges //["0.0.0.0/0"]
allow {
protocol = var.protocol //"tcp"
ports = var.ports //["22", "8080", "5000"]
}
}
