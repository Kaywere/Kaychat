# Stage 1: Use an official Node.js runtime as a parent image
FROM node:20-alpine AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the root package.json and package-lock.json
# This leverages Docker's layer caching
COPY package*.json ./

# Copy the frontend and backend folders so we can install their dependencies
COPY frontend/ ./frontend/
COPY backend/ ./backend/

# Run your build script from the root package.json
# This will:
# 1. npm install --prefix backend
# 2. npm install --prefix frontend
# 3. npm run build --prefix frontend

RUN npm run build

# The command to run your application when the container starts
# This will execute: npm run start --prefix backend
CMD ["npm", "run", "start"]