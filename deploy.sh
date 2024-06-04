#!/bin/bash

# Arguments passed to the script
IMAGE_URI=$1

# Container name
CONTAINER_NAME="devops-container"

# Stop the existing container if it is running
if [ "$(docker ps -q -f name=${CONTAINER_NAME})" ]; then
    echo "Stopping the existing container..."
    docker stop ${CONTAINER_NAME}
fi

# Remove the existing container if it exists
if [ "$(docker ps -aq -f name=${CONTAINER_NAME})" ]; then
    echo "Removing the existing container..."
    docker rm ${CONTAINER_NAME}
fi

# Pull the new image from ECR
echo "Pulling the new image: ${IMAGE_URI}..."
docker pull ${IMAGE_URI}

echo "Running the new container..."
docker run -d --name ${CONTAINER_NAME} -p 80:80 ${IMAGE_URI}

echo "Deployment completed successfully."
