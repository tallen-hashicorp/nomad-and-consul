#!/bin/bash

# This script sets selinux to permissive as running into nomad/podman selinux issues
# THIS IS NOT RECOMMENDED FOR PRODUCTION USE CASES

# Update SELINUX value to permissive in /etc/sysconfig/selinux
sudo sed -i 's/^SELINUX=.*/SELINUX=permissive/' /etc/sysconfig/selinux

# Verify the change
grep ^SELINUX= /etc/sysconfig/selinux

# Apply the change
sudo setenforce 0

# Confirm SELinux status
sudo sestatus