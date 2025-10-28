#!/bin/bash
set -e

echo "Running ApplicationStop step..."

if systemctl is-active --quiet httpd; then
    echo "Stopping Apache..."
    sudo systemctl stop httpd
elif systemctl is-active --quiet nginx; then
    echo "Stopping Nginx..."
    sudo systemctl stop nginx
else
    echo "No web server running."
fi

echo "ApplicationStop step completed."
