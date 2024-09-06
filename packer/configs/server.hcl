data_dir  = "/opt/nomad/data"

bind_addr = "0.0.0.0" # the default

server {
  license_path = "/etc/nomad.d/license.hclic"
  enabled          = true
  bootstrap_expect = 3
  server_join {
    retry_join: ["provider=gce tag_value=nomad-server"]
  }
}

client {
  enabled       = false
}

consul {
  address = "1.2.3.4:8500"
}