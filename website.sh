#!/bin/bash

# Update the package manager and install Docker
sudo apt-get update -y
sudo apt-get install -y docker.io

# Start the Docker service
sudo systemctl start docker

# Enable Docker to start on boot
sudo systemctl enable docker

# Pull and run a simple Nginx web server container
sudo docker run -d --name my-nginx -p 8080:80 nginx:latest
sudo docker run -d --name zomato -p 3000:3000 mahesh117/zomato:latest
sudo docker run -d --name netflix -p 8081:80 mahesh117/netflix:latest
