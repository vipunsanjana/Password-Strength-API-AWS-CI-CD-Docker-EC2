#!/bin/bash
set -e

# Load from SSM Parameter Store
USERNAME=$(aws ssm get-parameter --name "/Password-Strength-API-AWS-CI-CD-Docker-EC2/docker/username" --with-decryption --query "Parameter.Value" --output text)
REGISTRY=$(aws ssm get-parameter --name "/Password-Strength-API-AWS-CI-CD-Docker-EC2/docker/registry" --with-decryption --query "Parameter.Value" --output text)
IMAGE_NAME="Password-Strength-API-AWS-CI-CD-Docker-EC2"
PORT=8000

FULL_IMAGE="$REGISTRY/$USERNAME/$IMAGE_NAME:latest"

echo "Pulling image: $FULL_IMAGE"
docker pull $FULL_IMAGE

echo "Starting container..."
docker run -d --name Password-Strength-API -p $PORT:8000 $FULL_IMAGE

echo "Container $FULL_IMAGE started on port $PORT."