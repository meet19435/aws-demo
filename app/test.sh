#!/bin/bash

# Get the container ID
CONTAINER_ID=$(docker ps -aqf "name=project-pythonapp")

# Get the container IP address
CONTAINER_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_ID)

# Display the environment variable
echo "$CONTAINER_IP" > container_ip.txt
echo "$CONTAINER_IP"
docker exec $CONTAINER_ID poetry run pytest
