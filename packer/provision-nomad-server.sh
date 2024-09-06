#!/bin/bash

# Update system packages
sudo dnf update -y

# Install required packages
sudo dnf install -y unzip curl wget

# Add HashiCorp's official RPM repository
curl -fsSL https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo | sudo tee /etc/yum.repos.d/hashicorp.repo

# Install Nomad
sudo dnf install -y nomad

# Enable Nomad to start at boot
sudo systemctl enable nomad

# Start the Nomad service
sudo systemctl start nomad

# Check Nomad status
sudo systemctl status nomad
