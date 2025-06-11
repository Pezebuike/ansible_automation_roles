#!/bin/bash

# Complete Prometheus Alertmanager Ansible Project Setup Script

set -e

PROJECT_NAME="prometheus_alertmanager_project"

echo "=== Setting up Prometheus Alertmanager Ansible Project ==="
echo "Project: $PROJECT_NAME"

# Create main project directory
mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"

echo "📁 Creating directory structure..."

# Create all directories
mkdir -p roles/prometheus_alertmanager_config/{tasks,handlers,defaults,vars,meta,templates/notifications}
mkdir -p playbooks
mkdir -p inventory  
mkdir -p group_vars/alertmanager_servers
mkdir -p scripts
mkdir -p docs

echo "✅ Directory structure created"

echo ""
echo "📋 Next steps:"
echo ""
echo "1. Copy artifact files to their locations:"
echo "   roles/prometheus_alertmanager_config/tasks/main.yml"
echo "   roles/prometheus_alertmanager_config/handlers/main.yml"
echo "   roles/prometheus_alertmanager_config/defaults/main.yml"
echo "   roles/prometheus_alertmanager_config/vars/main.yml"
echo "   roles/prometheus_alertmanager_config/meta/main.yml"
echo "   roles/prometheus_alertmanager_config/templates/alertmanager.yml.j2"
echo "   roles/prometheus_alertmanager_config/templates/notifications/default.tmpl.j2"
echo "   roles/prometheus_alertmanager_config/README.md"
echo ""
echo "2. Copy playbook and inventory files:"
echo "   playbooks/simple-playbook.yml"
echo "   playbooks/troubleshooting-playbook.yml"
echo "   inventory/inventory.ini"
echo ""
echo "3. Copy helper scripts:"
echo "   scripts/find-amtool.sh"
echo "   scripts/test-deployment.sh"
echo "   scripts/create-alertmanager-user.sh"
echo "   scripts/setup-role.sh"
echo ""
echo "4. Make scripts executable:"
echo "   chmod +x scripts/*.sh"
echo ""
echo "5. Update inventory with your server details:"
echo "   Edit inventory/inventory.ini"
echo ""
echo "6. Test and deploy:"
echo "   bash scripts/test-deployment.sh"
echo "   ansible-playbook playbooks/simple-playbook.yml -i inventory/inventory.ini"

echo ""
echo "🎯 Project structure ready at: $(pwd)"
echo ""
echo "Directory tree:"
tree . 2>/dev/null || find . -type d | sed 's|[^/]*/|  |g; s|^  ||; /^$/d'