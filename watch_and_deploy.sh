#!/bin/bash

IMAGE_NAME="chakib/arithmetic-api"
CONTAINER_NAME="arithmetic-api-container"

echo "[INFO] Watching for changes..."

while true; do
    inotifywait -e modify,create,delete -r .
    echo "[INFO] Change detected! Rebuilding..."

    docker stop $CONTAINER_NAME 2>/dev/null
    docker rm $CONTAINER_NAME 2>/dev/null
    docker build -t $IMAGE_NAME .
    docker run -d --name $CONTAINER_NAME -p 5000:5000 $IMAGE_NAME

    echo "[INFO] Redeployed successfully!"
done
