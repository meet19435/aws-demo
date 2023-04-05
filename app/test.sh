#!/bin/bash

# Get the container ID
CONTAINER_ID=$(sudo docker ps -aqf "name=aws-demo_pythonapp")

# Get the container IP address
CONTAINER_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_ID)

# Set the DOCKER_FLASK_IP environment variable
export DOCKER_FLASK_IP="$CONTAINER_IP"

# Display the environment variable
echo "$CONTAINER_IP" > container_ip.txt
sudo docker exec $(sudo docker ps -aqf "name=aws-demo_pythonapp") poetry run pytest
