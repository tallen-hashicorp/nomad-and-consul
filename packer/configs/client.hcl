data_dir  = "/opt/nomad/data"

bind_addr = "0.0.0.0" # the default

server {
  license_path = "/etc/nomad.d/license.hclic"
  enabled          = false
}

client {
  enabled       = true
  server_join {
    retry_join: ["provider=gce tag_value=nomad-server"]
  }
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

consul {
  address = "1.2.3.4:8500"
}