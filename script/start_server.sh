#!/bin/bash
set -e

echo "Running ApplicationStart step..."

if systemctl list-units --type=service | grep -q httpd; then
    echo "Starting Apache..."
    sudo systemctl start httpd
elif systemctl list-units --type=service | grep -q nginx; then
    echo "Starting Nginx..."
    sudo systemctl start nginx
else
    echo "No web server service found to start."
fi

echo "ApplicationStart step completed."
