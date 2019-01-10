resource "google_compute_network" "example" {
  provider = "google"

  auto_create_subnetworks = "false"
  description             = "demo the bug"
  name                    = "example"
  project                 = "${var.gcp_project}"
  routing_mode            = "REGIONAL"
}
