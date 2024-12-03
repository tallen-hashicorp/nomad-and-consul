job "backend-test" {
  type      = "service"

  group "backend-test" {
    count = 1

    network {
      mode = "bridge"
    }

    service {
      name = "backend"
      connect {
        sidecar_service {}
      }
    }

    task "backend" {
      driver = "docker"

      consul {
        namespace = "default"
      }

      config {
        image = "busybox"
        command = "sh"
        args    = ["-c", "while true; do sleep 3600; done"]
        ports = ["http"]
      }

      resources {
        cpu    = 500
        memory = 256
      }
    }
  }
}