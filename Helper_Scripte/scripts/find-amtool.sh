#!/bin/bash

echo "=== Finding amtool on your system ==="

# Common locations to check
LOCATIONS=(
    "/usr/bin/amtool"
    "/usr/local/bin/amtool"
    "/opt/alertmanager/amtool"
    "/opt/alertmanager/bin/amtool"
    "/snap/bin/amtool"
)

found=false

for location in "${LOCATIONS[@]}"; do
    if [ -f "$location" ]; then
        echo "✅ Found amtool at: $location"
        echo "   Version: $($location --version 2>/dev/null || echo 'Unknown')"
        found=true
    fi
done

if [ "$found" = false ]; then
    echo "❌ amtool not found in common locations"
    echo ""
    echo "Searching entire system (this may take a moment)..."
    
    # Search for amtool anywhere
    amtool_paths=$(find /usr /opt /home /snap -name "amtool" -type f 2>/dev/null)
    
    if [ -n "$amtool_paths" ]; then
        echo "Found amtool at:"
        echo "$amtool_paths"
    else
        echo "❌ amtool not found on this system"
        echo ""
        echo "📋 Installation options:"
        echo ""
        echo "1. Install via package manager:"
        echo "   # Ubuntu/Debian:"
        echo "   sudo apt update && sudo apt install prometheus-alertmanager"
        echo ""
        echo "   # CentOS/RHEL:"
        echo "   sudo yum install alertmanager"
        echo ""
        echo "2. Download binary manually:"
        echo "   wget https://github.com/prometheus/alertmanager/releases/download/v0.25.0/alertmanager-0.25.0.linux-amd64.tar.gz"
        echo "   tar xzf alertmanager-0.25.0.linux-amd64.tar.gz"
        echo "   sudo cp alertmanager-0.25.0.linux-amd64/amtool /usr/local/bin/"
        echo ""
        echo "3. Skip validation in Ansible:"
        echo "   Set: alertmanager_validate_config: false"
    fi
fi

echo ""
echo "=== Ansible Configuration ==="
echo "To use with Ansible, set the correct path in your playbook:"
echo ""
echo "vars:"
echo "  alertmanager_validate_config: true"
echo "  alertmanager_binary_path: /path/to/directory/containing/amtool"
echo ""
echo "Or disable validation:"
echo "vars:"
echo "  alertmanager_validate_config: false"