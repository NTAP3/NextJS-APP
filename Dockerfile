# Use an official Node.js runtime as the base image
FROM node:18-alpine AS base

# Set the working directory in the container to /app
WORKDIR /my-appp

# Copy the package.json and package-lock.json files to the container
COPY package*.json ./

# Install the app's dependencies
RUN npm install

# Copy the rest of the app's files to the container
COPY . .

# Specify the command to run when the container starts
CMD ["npm", "run", "dev"]
