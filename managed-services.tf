resource "google_service_networking_connection" "private_vpc_connection" {
  provider = "google-beta.workaround" # works

  #provider = "google-beta" # does not work

  network                 = "${google_compute_network.example.name}"
  service                 = "${var.gcp_managed_services_name}"
  reserved_peering_ranges = ["${var.gcp_managed_services_cidr_name_stem}-${google_compute_network.example.name}"]
}
