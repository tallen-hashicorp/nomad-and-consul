#!/bin/bash

# Initialize Packer configurations
packer init packer/gcp-almalinux-nomad-server.pkr.hcl
packer init packer/gcp-almalinux-nomad-client.pkr.hcl

# Run Packer builds in parallel
packer build -var-file=variables.pkrvars.hcl packer/gcp-almalinux-nomad-server.pkr.hcl &
packer build -var-file=variables.pkrvars.hcl packer/gcp-almalinux-nomad-client.pkr.hcl &

# Wait for all background processes to complete
wait

echo "Both Packer builds are complete."
