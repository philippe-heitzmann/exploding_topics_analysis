#!/bin/bash

# Navigate to the project directory where the Dockerfile is located
PROJECT_DIR="/Users/philippeheitzmann/Projects/jupyter_data_analysis_exploding_topics"
cd "$PROJECT_DIR" || { echo "Directory $PROJECT_DIR not found."; exit 1; }

# Build the Docker image
docker build -t exploding_topics:v1 .

# Check if the build was successful
if [ $? -ne 0 ]; then
  echo "Docker build failed."
  exit 1
fi

# Run the Docker container in the foreground
docker run -p 8888:8888 exploding_topics:v1
