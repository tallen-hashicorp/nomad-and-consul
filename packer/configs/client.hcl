data_dir  = "/opt/nomad/data"

bind_addr = "0.0.0.0" # the default

log_level = "INFO"
log_file = "/var/log/"
log_rotate_duration = "24h"
log_rotate_max_files = 5

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