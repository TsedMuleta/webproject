#!/bin/bash
set -e  # Exit immediately if a command fails

echo "Running BeforeInstall step..."

# Stop the web server before cleaning up
if systemctl is-active --quiet httpd; then
    echo "Stopping Apache..."
    sudo systemctl stop httpd
elif systemctl is-active --quiet nginx; then
    echo "Stopping Nginx..."
    sudo systemctl stop nginx
else
    echo "No web server running."
fi

# Clean existing files
echo "Cleaning up old application files..."
sudo rm -rf /var/www/html/*

# Ensure script permissions are correct
echo "Making deployment scripts executable..."
sudo chmod +x /opt/codedeploy-agent/deployment-root/deployment-*/deployment-*/scripts/*.sh

echo "BeforeInstall step completed."
