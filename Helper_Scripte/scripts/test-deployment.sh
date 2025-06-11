#!/bin/bash

echo "=== Testing Ansible Alertmanager Role ==="

# Check syntax
echo "1. Checking YAML syntax..."
if ansible-playbook --syntax-check simple-playbook.yml -i inventory.ini; then
    echo "✅ YAML syntax is valid"
else
    echo "❌ YAML syntax errors found"
    exit 1
fi

# Check if inventory is reachable
echo ""
echo "2. Testing connectivity..."
if ansible all -i inventory.ini -m ping; then
    echo "✅ Can connect to hosts"
else
    echo "❌ Cannot connect to hosts"
    exit 1
fi

# Dry run
echo ""
echo "3. Running dry-run (check mode)..."
if ansible-playbook simple-playbook.yml -i inventory.ini --check --diff; then
    echo "✅ Dry-run completed successfully"
else
    echo "❌ Dry-run failed"
    exit 1
fi

# Actual deployment
echo ""
echo "4. Ready for actual deployment!"
echo "Run: ansible-playbook simple-playbook.yml -i inventory.ini"
echo ""
echo "Or with verbose output:"
echo "Run: ansible-playbook simple-playbook.yml -i inventory.ini -vvv"

echo ""
echo "=== Post-deployment verification commands ==="
echo "# Check if config file was created:"
echo "ansible all -i inventory.ini -m shell -a 'ls -la /etc/alertmanager/'"
echo ""
echo "# Check alertmanager service status:"
echo "ansible all -i inventory.ini -m shell -a 'systemctl status alertmanager'"
echo ""
echo "# View generated config:"
echo "ansible all -i inventory.ini -m shell -a 'cat /etc/alertmanager/alertmanager.yml'"