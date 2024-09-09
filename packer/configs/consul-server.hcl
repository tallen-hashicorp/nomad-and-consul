datacenter              = "nomad"

data_dir                = "/opt/consul"

bind_addr               = "0.0.0.0" # the default
client_addr             = "0.0.0.0"

log_level               = "INFO"
log_file                = "/var/log/"
log_rotate_duration     = "24h"
log_rotate_max_files    = 5

server                  = true

bootstrap_expect        = 3
retry_join              = ["provider=gce tag_value=nomad-server"]

license_path            = "/etc/consul.d/license.hclic"

ui_config {
    enabled             = true
}

service {
    name                = "hashicorp/nomad-server"
    port                = 4646
    check {
        http            = "http://localhost:4646/v1/status/leader"
        interval        = "10s"
        timeout         = "1s"
    }
}

telemetry {
    prometheus_retention_time   = "480h"
    disable_hostname            = true
}