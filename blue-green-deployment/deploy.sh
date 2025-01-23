#!/bin/bash

# Variables
VHOST_CONF_PATH="/etc/httpd/conf.d/httpd-vhost.conf"
BLUE_PORT=8080
GREEN_PORT=8081

# Determine active container
if grep -q "ProxyPass / http://127.0.0.1:$BLUE_PORT/" $VHOST_CONF_PATH; then
    echo "Blue is active. Switching to Green..."
    ACTIVE_PORT=$BLUE_PORT
    TARGET_PORT=$GREEN_PORT
    ACTIVE_CONTAINER="golang-api-blue"
    TARGET_CONTAINER="golang-api-green"
else
    echo "Green is active. Switching to Blue..."
    ACTIVE_PORT=$GREEN_PORT
    TARGET_PORT=$BLUE_PORT
    ACTIVE_CONTAINER="golang-api-green"
    TARGET_CONTAINER="golang-api-blue"
fi

# Build and deploy the target container
echo "Building and deploying $TARGET_CONTAINER..."
docker-compose build $TARGET_CONTAINER
docker-compose up -d $TARGET_CONTAINER

# Wait for the new container to be healthy
echo "Waiting for $TARGET_CONTAINER to become healthy..."
sleep 10  # Adjust this based on app startup time

# Update VirtualHost configuration
echo "Updating VirtualHost configuration to point to $TARGET_PORT..."
sudo sed -i "s|http://127.0.0.1:$ACTIVE_PORT/|http://127.0.0.1:$TARGET_PORT/|g" $VHOST_CONF_PATH

# Reload Apache to apply the changes
echo "Reloading Apache..."
sudo systemctl reload httpd

# Stop and remove the old container
echo "Stopping and removing $ACTIVE_CONTAINER..."
docker-compose stop $ACTIVE_CONTAINER
docker-compose rm -f $ACTIVE_CONTAINER

echo "Deployment completed. Active service: $TARGET_CONTAINER"
