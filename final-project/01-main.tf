resource "digitalocean_kubernetes_cluster" "hamilton" {
  name    = "hamilton"
  region  = "nyc1"
  version = "1.20.2-do.0"

  node_pool {
    name       = "hamilton-nodes"
    size       = "s-1vcpu-2gb"
    node_count = 1
    tags = ["hamilton-nodes"]
  }
}
