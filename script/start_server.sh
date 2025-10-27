#!/bin/bash
echo "Starting web server..."
sudo systemctl start httpd || sudo systemctl start nginx
