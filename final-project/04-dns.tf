# Creamos un dominio nuevo

resource "digitalocean_domain" "hamiltontm" {
  name = "hamiltontm.com"
}

# Add a record to the domain
resource "digitalocean_record" "cloud_computing" {
  domain = "${digitalocean_domain.hamiltontm.name}"
  type   = "A"
  name   = "cloud-computing"
  ttl    = "30"
  value  = "${digitalocean_loadbalancer.public.ip}"
}
