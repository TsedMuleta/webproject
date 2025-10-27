#!/bin/bash
echo "Stopping web server..."
sudo systemctl stop httpd || sudo systemctl stop nginx
