locals {
  consul_server_ips = [for instance in google_compute_instance.consul_servers : instance.network_interface[0].access_config[0].nat_ip]
}

provider "consul" {
  address    = "${local.consul_server_ips[0]}:8500"
}

## We need to wit for consul to be ready
resource "null_resource" "wait_for_consul" {
  provisioner "local-exec" {
    command = <<EOT
    for i in {1..20}; do
      if curl -s "${local.consul_server_ips[0]}:8500/v1/status/leader" | grep -qv '""'; then
        sleep 5
        echo "Consul is ready"
        exit 0
      fi
      echo "Waiting for Consul..."
      sleep 10
    done
    echo "Consul did not become ready in time"
    exit 1
    EOT
  }

  depends_on = [google_compute_instance.consul_servers]
}

resource "consul_admin_partition" "testservices" {
  name        = "testservices"
  description = "testing services"
  depends_on = [ google_compute_instance.consul_servers ]
}