locals {
  nomad_server_ips = [for instance in google_compute_instance.nomad_servers : instance.network_interface[0].access_config[0].nat_ip]
}

provider "nomad" {
  address = "http://${local.nomad_server_ips[0]}:4646"
}

## We need to wit for consul to be ready
resource "null_resource" "wait_for_nomad" {
  provisioner "local-exec" {
    command = <<EOT
    for i in {1..20}; do
      if curl -s "${local.nomad_server_ips[0]}:4646/v1/status/leader" | grep -qv '""'; then
        sleep 20
        echo "Nomad is ready"
        exit 0
      fi
      echo "Waiting for Nomad..."
      sleep 10
    done
    echo "Nomad did not become ready in time"
    exit 1
    EOT
  }

  depends_on = [google_compute_instance.nomad_servers]
}

resource "nomad_job" "backend" {
  jobspec = file("${path.module}/nomad-jobs/backend.hcl")

  depends_on = [null_resource.wait_for_nomad]
}