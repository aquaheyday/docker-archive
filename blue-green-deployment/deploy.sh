#!/bin/bash

set -e

BLUE_PORT=8080
GREEN_PORT=8081
NGINX_CONF="./nginx.conf"

# 현재 실행 중인 컨테이너 확인
CURRENT_RUNNING=$(docker ps --filter "name=app-blue" --format "{{.Names}}")

if [ "$CURRENT_RUNNING" == "app-blue" ]; then
    NEW_ENV="green"
    NEW_PORT=$GREEN_PORT
    OLD_ENV="blue"
    OLD_PORT=$BLUE_PORT
else
    NEW_ENV="blue"
    NEW_PORT=$BLUE_PORT
    OLD_ENV="green"
    OLD_PORT=$GREEN_PORT
fi

echo "Current environment: $OLD_ENV"
echo "Deploying new environment: $NEW_ENV"

docker-compose up -d $NEW_ENV

echo "Waiting for the new environment to become healthy..."
until [ "$(docker inspect --format='{{json .State.Health.Status}}' app-$NEW_ENV)" == "\"healthy\"" ]; do
    sleep 2
    echo "Waiting..."
done

echo "New environment ($NEW_ENV) is healthy!"

echo "Updating Nginx configuration to route traffic to $NEW_ENV..."
sed -i "s/server .*:808[0-9];/server localhost:$NEW_PORT;/" $NGINX_CONF

echo "Reloading Nginx..."
docker exec nginx nginx -s reload

echo "Traffic successfully routed to $NEW_ENV!"

echo "Stopping and removing old environment ($OLD_ENV)..."
docker-compose stop $OLD_ENV
docker-compose rm -f $OLD_ENV

echo "Deployment complete!"
