#!/bin/bash
set -e

# --- Load values from AWS SSM Parameter Store ---
echo "Fetching Docker credentials from SSM..."

USERNAME=$(aws ssm get-parameter --name "/Password-Strength-API-AWS-CI-CD-Docker-EC2/docker/username" --with-decryption --query "Parameter.Value" --output text)
REGISTRY=$(aws ssm get-parameter --name "/Password-Strength-API-AWS-CI-CD-Docker-EC2/docker/registry" --with-decryption --query "Parameter.Value" --output text)

# --- Configuration ---
IMAGE_NAME="password-strength-api-aws-ci-cd-docker-ec2"   
PORT=8000
FULL_IMAGE="$REGISTRY/$USERNAME/$IMAGE_NAME:latest"

# --- Pull latest image from Docker registry ---
echo "Pulling Docker image: $FULL_IMAGE"
docker pull "$FULL_IMAGE"

# --- Start the container ---
echo "Starting new container..."
docker run -d --name Password-Strength-API -p $PORT:8000 "$FULL_IMAGE"

# --- Confirm status ---
echo "Container '$FULL_IMAGE' started successfully on port $PORT."
docker ps --filter "name=Password-Strength-API"
