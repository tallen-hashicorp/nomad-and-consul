datacenter              = "nomad"

data_dir                = "/opt/consul"

bind_addr               = "0.0.0.0" # the default

log_level               = "INFO"
log_file                = "/var/log/"
log_rotate_duration     = "24h"
log_rotate_max_files    = 5

server                  = false

retry_join              = ["provider=gce tag_value=nomad-server"]

license_path            = "/etc/consul.d/license.hclic"

service {
    name                = "hashicorp/nomad-server"
    port                = 4647
    check {
        http            = "http://localhost:4647/v1/status/leader"
        interval        = "10s"
        timeout         = "1s"
    }
}

telemetry {
    prometheus_retention_time   = "480h"
    disable_hostname            = true
}