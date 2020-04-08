variable "location" {
  type    =  string
  default = "asia-northeast1"
}


resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = var.location

  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = "admin"
    password = "my-gke-clustermy-gke-cluster"
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "my-gke-node-pool"
  location   = var.location
  cluster    = google_container_cluster.primary.name
  node_count = 3

  management {
    auto_repair = true
  }

  node_config {
    machine_type = "n1-standard-2"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
