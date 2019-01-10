provider "google" {
  version     = "~> 1.20"
  credentials = "${file("account.json")}"
}

provider "google-beta" {
  version     = "~> 1.20"
  credentials = "${file("account.json")}"
}

provider "google-beta" {
  version     = "~> 1.20"
  credentials = "${file("account.json")}"
  project     = "${var.gcp_project}"

  alias = "workaround"
}
