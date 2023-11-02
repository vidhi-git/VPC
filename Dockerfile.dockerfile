# Use a base image
FROM nginx:latest

# Copy your HTML code to the web server directory
COPY . /usr/share/nginx/html