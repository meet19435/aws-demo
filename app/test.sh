#!/bin/bash

# Get the container ID
CONTAINER_ID=$(docker ps -aqf "name=project-pythonapp")
docker exec $CONTAINER_ID poetry run pytest
