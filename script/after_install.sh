#!/bin/bash
set -e

echo "Running AfterInstall step..."

# Copy new files to /var/www/html (if CodeDeploy extracted elsewhere)
if [ -d /tmp/webproject ]; then
    echo "Copying new application files..."
    sudo cp -r /tmp/webproject/* /var/www/html/
else
    echo "Warning: /tmp/webproject not found. Skipping copy."
fi

# Fix file permissions
sudo chown -R ec2-user:ec2-user /var/www/html
sudo chmod -R 755 /var/www/html

echo "AfterInstall step completed."
