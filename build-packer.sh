#!/bin/bash

# Initialize Packer configurations
packer init packer/gcp-almalinux-nomad-server.pkr.hcl
packer init packer/gcp-almalinux-nomad-client.pkr.hcl
packer init packer/gcp-almalinux-consul-server.pkr.hcl
packer init packer/gcp-almalinux-nginx.pkr.hcl

# Run Packer builds in parallel
packer build -var-file=variables.pkrvars.hcl packer/gcp-almalinux-nomad-server.pkr.hcl &
packer build -var-file=variables.pkrvars.hcl packer/gcp-almalinux-nomad-client.pkr.hcl &
packer build -var-file=variables.pkrvars.hcl packer/gcp-almalinux-consul-server.pkr.hcl &
packer build -var-file=variables.pkrvars.hcl packer/gcp-almalinux-nginx.pkr.hcl &

# Wait for all background processes to complete
wait

echo "All Packer builds are complete."
