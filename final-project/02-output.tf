resource "local_file" "kubernetes_config" {
  content = "${digitalocean_kubernetes_cluster.hamilton.kube_config.0.raw_config}"
  filename = "kubeconfig.yaml"
}
