#!/bin/bash

# Script to create alertmanager user and directories manually
# Run this on your target servers if you prefer manual setup

set -e

echo "Creating alertmanager user and group..."

# Create group
sudo groupadd --system alertmanager || echo "Group already exists"

# Create user
sudo useradd \
    --system \
    --no-create-home \
    --home-dir /var/lib/alertmanager \
    --shell /bin/false \
    --gid alertmanager \
    alertmanager || echo "User already exists"

# Create directories
sudo mkdir -p /etc/alertmanager
sudo mkdir -p /etc/alertmanager/templates
sudo mkdir -p /var/lib/alertmanager

# Set ownership
sudo chown -R alertmanager:alertmanager /etc/alertmanager
sudo chown -R alertmanager:alertmanager /var/lib/alertmanager

# Set permissions
sudo chmod 755 /etc/alertmanager
sudo chmod 755 /etc/alertmanager/templates
sudo chmod 755 /var/lib/alertmanager

echo "Alertmanager user and directories created successfully!"
echo "You can now run your Ansible playbook with:"
echo "alertmanager_create_user: false"