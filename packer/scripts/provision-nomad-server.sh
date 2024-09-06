#!/bin/bash

# Update system packages
sudo dnf update -y

# Install required packages
sudo dnf install -y unzip curl wget

# Add HashiCorp's official RPM repository
curl -fsSL https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo | sudo tee /etc/yum.repos.d/hashicorp.repo

# Install Nomad
sudo dnf install -y nomad

# Upgrade to ent
wget https://releases.hashicorp.com/nomad/1.8.3+ent/nomad_1.8.3+ent_linux_amd64.zip
unzip nomad_1.8.3+ent_linux_amd64.zip
chmod +x nomad
sudo chown root:root nomad
sudo mv nomad /usr/bin/nomad
nomad --version

# Copy config file
sudo cp /tmp/nomad.hcl /etc/nomad.d/nomad.hcl

# Enable Nomad to start at boot
sudo systemctl enable nomad